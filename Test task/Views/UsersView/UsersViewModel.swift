//
//  UsersViewModel.swift
//  Test task
//
//  Created by Сергей on 22.03.2021.
//

import Foundation

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    
    var isLastPage: Bool {
        listUsers?.totalPages == listUsers?.page
    }
    
    var isFirsPage: Bool {
        listUsers?.page == 1
    }
    
    private var listUsers: ListUsers?
    
    func actionNextPage() {
        guard let currentPage = listUsers?.page, !isLastPage else { return }
        
        let url = usersURL(page: String(currentPage + 1))
        fetchUsers(url: url)
    }
    
    func actionBackPage() {
        guard let currentPage = listUsers?.page, !isFirsPage else { return }
        
        let url = usersURL(page: String(currentPage - 1))
        fetchUsers(url: url)
    }
    
    func fetchUsers(url: String) {
        NetworkManager.shared.fetchUsers(from: url) { listUsers in
            guard let users = listUsers.data else { return }
            self.listUsers = listUsers
            self.users = users
            
            print(listUsers)
        }
    }
    
    private func usersURL(page number: String) -> String {
        "\(URLS.users.rawValue)?page=\(number)"
    }
    
}
