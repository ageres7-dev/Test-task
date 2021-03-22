//
//  LoadImage.swift
//  Test task
//
//  Created by Сергей on 22.03.2021.
//

//import UIKit
import SwiftUI

class CachedImage {
    static let shared = CachedImage()
    private init() {}
//    func tes() {
//        fetchImage(from: <#T##String?#>, completion: <#T##(Image) -> ()#>)
//    }
    
   func fetchImage(from url: String?, completion: @escaping (_ image: Image)->()) -> Void {
        guard let imageURL = URL(string: url ?? "") else {
            completion(Image("person"))
            return
        }
        
        // Загрузка изображения из кэша, если оно там есть
        if let cachedImage = getCachedImage(from: imageURL) {
            completion(Image(uiImage: cachedImage))
            return
        }
        
        // Загрузка изображения из сети
        ImageManager.shared.fetchImage(from: imageURL) { (data, response) in
            guard let uiImage = UIImage(data: data) else {
                completion(Image("person"))
                return
            }
            
            DispatchQueue.main.async {
                completion(Image(uiImage: uiImage))
            }
            
            // Сохраняем изображение в кэш
            self.saveDataToCach(with: data, and: response)
        }
    }
    
    private func getCachedImage(from url: URL) -> UIImage? {
        let urlRequest = URLRequest(url: url)
        if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) {
            return UIImage(data: cachedResponse.data)
        }
        
        return nil
    }
    
    private func saveDataToCach(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        let urlRequest = URLRequest(url: url)
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: urlRequest)
    }
}
