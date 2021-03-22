//
//  Network Manager.swift
//  Test task
//
//  Created by Сергей on 20.03.2021.
//

import Foundation

enum URLS: String {
    case register = "https://reqres.in/api/register"
    case login = "https://reqres.in/api/login"
    case users = "https://reqres.in/api/users"
}




class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    /*
    func register(username: String, password: String) {
        guard let url = URL(string: URLS.register.rawValue) else { return }
        
        let body = [ "email" : username, "password" : password ]
        
        guard let registerData = try? JSONSerialization.data(withJSONObject: body, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = registerData
        
        URLSession.shared.dataTask(with: request) { (data, respons, error) in
            if let error = error {
                print("URLSession error\n \(error)")
                return
            }
            
            guard let respons = respons, let data = data else { return }
            
            
            print("data\n\(data)")
            print("URLSession responsr\n\(respons)")
            
            do {
                let token = try JSONSerialization.jsonObject(with: data, options: [])
//                DispatchQueue.main.async {
//                    // code
//                }
                print("token\n\(token)")
            } catch let error {
                print(error)
            }
            
            
        }.resume()
        
    }
    */
    
    func register(username: String, password: String, completion: @escaping (_ successful: Bool, _ response: Response) -> () ) {
        guard let url = URL(string: URLS.register.rawValue) else { return }
        
        let body = [ "email" : username, "password" : password ]
        
        guard let registerData = try? JSONSerialization.data(withJSONObject: body, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = registerData
        
        URLSession.shared.dataTask(with: request) { (data, respons, error) in
            if let error = error {
                print("URLSession error!!!! \(error)")
                return
            }
            guard let respons = respons as? HTTPURLResponse else { return }
            guard let data = data else { return }
//
//            print("URLSession respons\n\(respons)")
            
            do {
                let decode = JSONDecoder()
                let serverResponse = try decode.decode(Response.self, from: data)
                let successfulLogin = respons.statusCode == 200
                    && serverResponse.token != nil
                
                DispatchQueue.main.async {
                    completion(successfulLogin, serverResponse)
                }
                
            } catch let error {
                print("JSONSerialization error\n\(error)")
            }
        }.resume()
    }
    
    func login(username: String, password: String, completion: @escaping (_ successful: Bool, _ response: Response) -> () ) {
        guard let url = URL(string: URLS.login.rawValue) else { return }
        
        let body = [ "email" : username, "password" : password ]
        
        guard let loginData = try? JSONSerialization.data(withJSONObject: body, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = loginData
        
        URLSession.shared.dataTask(with: request) { (data, respons, error) in
            if let error = error {
                print("URLSession error!!!! \(error)")
                return
            }
            guard let respons = respons as? HTTPURLResponse else { return }
            guard let data = data else { return }
//            
//            print("URLSession respons\n\(respons)")
            
            do {
                let decode = JSONDecoder()
                let serverResponse = try decode.decode(Response.self, from: data)
                let successfulLogin = respons.statusCode == 200
                    && serverResponse.token != nil
                
                DispatchQueue.main.async {
                    completion(successfulLogin, serverResponse)
                }
                
            } catch let error {
                print("JSONSerialization error\n\(error)")
            }
        }.resume()
    }
    
}


struct Response: Codable {
    let id: Int?
    let token: String?
    let error: String?
}
