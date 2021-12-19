//
//  ContentView.swift
//  CoreDataProject
//
//  Created by f on 15.12.2021.
//
//Dynamically filtering fetched results with a fllexible struct.


import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var filterInitial = "A"
    
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: filterInitial) { (singer: Singer) in
                Text("\(singer.wrappedFirstName), \(singer.wrappedLastName)")
            }
            
            Button("Add Singers") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            Button("A filter") {
                filterInitial = "A"
            }
            Button("S filter") {
                filterInitial = "S"
                print(type(of: Singer()))
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
