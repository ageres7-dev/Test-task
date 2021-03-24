//
//  UsersInfiniteScrollViewModel.swift
//  Test task
//
//  Created by Сергей on 23.03.2021.
//

import Foundation

class UsersInfiniteScrollViewModel: ObservableObject {
    @Published var users: [User] = []
    private(set) var listUsers: ListUsers?
    
    private let networkManager: NetworkManagerProtocol
    
    private var loadNewPage: Bool {
        guard let totalPages = listUsers?.totalPages,
              let page = listUsers?.page else { return true }

        return page != totalPages
    }
    
    init(networkManager: NetworkManagerProtocol = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func actionLoadPage() {
        guard loadNewPage else { return }
        
        let page = listUsers?.page ?? 0
        let url = usersURL(page: String(page + 1))
        fetchUsers(url: url)
        
        print("load New Page")
    }
    
    private func fetchUsers(url: String) {
        //        NetworkManager.shared.fetchUsers(from: url) { listUsers in
        networkManager.fetchUsers(from: url) { listUsers in
            guard let users = listUsers.data else { return }
            
            self.listUsers = listUsers
            self.users.append(contentsOf: users)
            
            print(listUsers)
        }
    }
    
    func usersURL(page number: String) -> String {
        "\(URLS.users.rawValue)?page=\(number)"
    }
}
