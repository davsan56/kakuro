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
    
    var size: Double = 50
    var offset: Double = 0.5
    
    var body: some View {
        ZStack {
            if (bottomNumber != nil) {
                Path { path in
                    path.move(to: CGPoint(x: offset, y: offset))
                    path.addLine(to: CGPoint(x: offset, y: size))
                    path.addLine(to: CGPoint(x: size - (offset * 2), y: size))
                }
                    .foregroundColor(.gray)
                Text(String(bottomNumber!))
                    .position(x: CGFloat(size / 4), y: CGFloat(Double(size) / 1.5))
            }
            
            if (topNumber != nil) {
                Path { path in
                    path.move(to: CGPoint(x: offset * 2, y: offset))
                    path.addLine(to: CGPoint(x: size - offset, y: offset))
                    path.addLine(to: CGPoint(x: size - offset, y: size))
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

#if DEBUG
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
#endif
