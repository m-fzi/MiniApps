//
//  DetailView.swift
//  UserInformation
//
//  Created by f on 20.12.2021.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(user.name)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("Registered at: \(user.registerDate)")
                        .foregroundColor(.secondary)
                } .padding(.horizontal)
                Section {
                    List {
                        Text("Company: \(user.company)")
                        Text("email: \(user.email)")
                        Text("Address: \(user.address)")
                        Text("Age: \(String(user.age))")
                    }
                }
                Section("About \(user.name): ") {
                    Text(user.about)
                }
                .padding(.horizontal)
            }
        }
    }
}


