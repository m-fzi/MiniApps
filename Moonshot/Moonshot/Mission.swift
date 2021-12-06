//
//  Mission.swift
//  Moonshot
//
//  Created by f on 29.11.2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewMember: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewMember]
    let description: String

    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}

