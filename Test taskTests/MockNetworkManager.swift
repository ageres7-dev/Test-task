//
//  MockNetworkManager.swift
//  Test taskTests
//
//  Created by Сергей on 24.03.2021.
//

import XCTest
@testable import Test_task

enum TestingURLS: String {
    case firstPage = "https://reqres.in/api/users?page=1"
    case secondPage = "https://reqres.in/api/users?page=2"
    case finalPage = "https://reqres.in/api/users?page=3"
}

final class MockNetworkManager: NetworkManagerProtocol {
    static let shared = MockNetworkManager()
    private init() {}
    
    func fetchUsers(from url: String, completion: @escaping (ListUsers) -> ()) {
        let userOne = User(
            id: 1,
            email: "foo",
            firstName: "bar",
            lastName: "baz",
            avatar: nil
        )
        
        let userTwo = User(
            id: 2,
            email: "foo",
            firstName: "bar",
            lastName: "baz",
            avatar: nil
        )
        
        switch url {
        case TestingURLS.firstPage.rawValue:
            let listUsers = ListUsers(
                page: 1,
                perPage: 10,
                total: 30,
                totalPages: 3,
                data: [userOne]
            )
            completion(listUsers)
            
        case TestingURLS.secondPage.rawValue:
            let listUsers = ListUsers(
                page: 2,
                perPage: 10,
                total: 30,
                totalPages: 3,
                data: [userTwo]
            )
            completion(listUsers)
            
        case TestingURLS.finalPage.rawValue:
            let listUsers = ListUsers(
                page: 3,
                perPage: 10,
                total: 30,
                totalPages: 3,
                data: [userOne]
            )
            completion(listUsers)
            
        default:
            let listUsers = ListUsers(
                page: 6,
                perPage: 43,
                total: 43,
                totalPages: 343,
                data: [userOne]
            )
            completion(listUsers)
        }
    }

}
