//
//  SwiftUIView1.swift
//  Shapes
//
//  Created by f on 8.12.2021.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Double
    var columns: Double

    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(columns))
        } set {
            rows = newValue.first
            columns = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(columns)
        
        for row in 0..<Int(rows) {
            for column in 0..<Int(columns) {
                if (row + column).isMultiple(of: 2) {
                    let startX = Double(column) * columnSize
                    let startY = Double(row) * rowSize
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    
                    path.addRect(rect)
                }
            }
        }
        return path
    }
}

struct CheckerboardView: View {
    @State private var is8 = false
    
    var body: some View {
        Checkerboard(rows: is8 ? 8 : 4, columns: is8 ? 8 : 4)
            .frame(width: 400, height: 400)
            .onTapGesture {
                withAnimation(.linear(duration: 2)) {
                    is8.toggle()
                }
            }
            
    }
}

struct Checkerboard_Previews: PreviewProvider {
    static var previews: some View {
        CheckerboardView()
            .preferredColorScheme(.dark)
    }
}
