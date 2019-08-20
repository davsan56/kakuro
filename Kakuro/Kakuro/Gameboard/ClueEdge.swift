//
//  ClueEdge.swift
//  Kakuro
//
//  Created by David San Antonio on 8/20/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct ClueEdge: View {
    var bottomNumber: Int?
    var topNumber: Int?
    
    var size = 50
    
    var body: some View {
        ZStack {
            if (bottomNumber != nil) {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addLine(to: CGPoint(x: 0, y: size))
                    path.addLine(to: CGPoint(x: size, y: size))
                }
                    .foregroundColor(.gray)
                Text(String(bottomNumber!))
                    .position(x: CGFloat(size / 4), y: CGFloat(Double(size) / 1.5))
            }
            
            if (topNumber != nil) {
                Path { path in
                    path.move(to: CGPoint(x: 1, y: 0))
                    path.addLine(to: CGPoint(x: size + 1, y: 0))
                    path.addLine(to: CGPoint(x: size + 1, y: size))
                }
                    .foregroundColor(.gray)
                Text(String(topNumber!))
                    .position(x: CGFloat(Double(size) / 1.5), y: CGFloat(size / 4))
            }
        }
        .frame(width: CGFloat(size), height: CGFloat(size), alignment: .center)
            .background(Color.black)
    }
}

struct ClueEdge_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClueEdge(bottomNumber: 43, topNumber: 7)
            ClueEdge(bottomNumber: 5)
            ClueEdge(topNumber: 32)
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
