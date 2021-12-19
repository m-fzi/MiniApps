//
//  Test.swift
//  CoreDataProject
//
//  Created by f on 17.12.2021.
//

import Foundation

extension Singer {
    public var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}
