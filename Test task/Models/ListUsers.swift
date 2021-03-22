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
}

// MARK: - Datum
struct User: Codable, Hashable {
    let id: Int?
    let email, firstName, lastName, avatar: String?
}
