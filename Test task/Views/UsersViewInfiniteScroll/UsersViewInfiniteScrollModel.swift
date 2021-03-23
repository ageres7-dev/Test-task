//
//  UsersViewInfiniteScrollModel.swift
//  Test task
//
//  Created by Сергей on 23.03.2021.
//

import Foundation

class UsersViewInfiniteScrollModel: ObservableObject {
    @Published var users: [User] = []
    private var listUsers: ListUsers?
    private var nextPage = 1
    private var loadNewPage: Bool {
        
        if listUsers?.totalPages == nil, listUsers?.page == nil {
            return true
        } else {
            return listUsers?.totalPages == nextPage
        }
    }
    
    func actionLoadPage() {
        guard loadNewPage else { return }
        let url = usersURL(page: String(nextPage))
        fetchUsers(url: url)
        nextPage += 1
    }
    
    private func fetchUsers(url: String) {
        NetworkManager.shared.fetchUsers(from: url) { listUsers in
            guard let users = listUsers.data else { return }
            self.listUsers = listUsers
            self.users.append(contentsOf: users)
            
            print(listUsers)
        }
    }
    
    private func usersURL(page number: String) -> String {
        "\(URLS.users.rawValue)?page=\(number)"
    }
    
}
