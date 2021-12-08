//
//  test.swift
//  FlowerShape
//
//  Created by f on 6.12.2021.
//

import SwiftUI

struct Flower1: Shape {
    var petalOffset = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let this = 
      
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffset, y: 0, width: petalWidth, height: rect.width / 2))
            
            path = originalPetal
        }
        return path
    }
}

struct test: View {
   
    var body: some View {
        VStack {
            Flower1
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
