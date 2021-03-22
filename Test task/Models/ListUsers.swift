//
//  ListUsers.swift
//  Test task
//
//  Created by Сергей on 22.03.2021.
//

import Foundation

// MARK: - Users
struct ListUsers: Codable, Hashable {
    let page, perPage, total, totalPages: Int?
    let data: [User]?

//    enum CodingKeys: String, CodingKey {
//        case page
//        case perPage = "per_page"
//        case total
//        case totalPages = "total_pages"
//        case data
//    }
}

// MARK: - Datum
struct User: Codable, Hashable {
    let id: Int?
    let email, firstName, lastName: String?
    let avatar: String?

//    enum CodingKeys: String, CodingKey {
//        case id, email
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case avatar
//    }
}
