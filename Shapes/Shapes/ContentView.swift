//
//  ContentView.swift
//  Shapes
//
//  Created by f on 8.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink {
                        FlowerShape()
                    } label: {
                        Rectangle()
                            .foregroundColor(.red)
                    }
                    NavigationLink {
                        ColorCyclingCircleView()
                    } label: {
                        Rectangle()
                            .foregroundColor(.yellow)
                    }
                }
                HStack {
                    NavigationLink {
                         CheckerboardView()
                    } label: {
                        Rectangle()
                            .foregroundColor(.gray)
                    }
                    NavigationLink {
                        SpirographView()
                    } label: {
                        Rectangle()
                            .foregroundColor(.purple)
                    }
                }
            }
            .frame(width: 300, height: 300)
            .navigationTitle("Cool Shapes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
