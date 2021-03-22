//
//  UsersViewModel.swift
//  Test task
//
//  Created by Сергей on 22.03.2021.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var listUsers: ListUsers?
    
    
    var users: [User] = []

    func fetchUsers() {
        NetworkManager.shared.fetchUsers(from: URLS.users.rawValue) { listUsers in
            self.listUsers = listUsers
            
            guard let users = listUsers.data else { return }
            
            self.users = users
            
            print(listUsers)
        }
    }
    
}
