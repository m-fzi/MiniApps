//
//  TestView.swift
//  FlowerShape
//
//  Created by f on 7.12.2021.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Circle()
            .inset(by: 9)
            .strokeBorder(Color(hue: 0.6, saturation: 0.1, brightness: 0.8), lineWidth: 3)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
