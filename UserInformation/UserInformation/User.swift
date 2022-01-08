//
//  User.swift
//  UserInformation
//
//  Created by f on 19.12.2021.
//

import Foundation

struct Friend: Codable, Identifiable {
    let id: String
    let name: String
}

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: Array<String>
    let friends: Array<Friend>
    
    var registerDate: String {
        registered.formatted(date: .abbreviated, time: .omitted)
    }
}

