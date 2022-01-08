//
//  ContentView.swift
//  UserInformation
//
//  Created by f on 19.12.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()

    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                Text(user.company)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text(user.isActive ? "🟢" : "🔴")
                        }
                    }
                }
            }
            .navigationTitle("Friends")
        }.onAppear(perform: users.isEmpty ? loadData : {print("hello, world")} )
    }
    
    
    func loadData() {
        let url = URL(string: "https://hackingwithswift.com/samples/friendface.json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let result = try? decoder.decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = result
                    }
                }
            }
        }.resume()
    }
}

    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

