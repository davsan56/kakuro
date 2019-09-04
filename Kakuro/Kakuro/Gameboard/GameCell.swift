//
//  Gameboard.swift
//  Kakuro
//
//  Created by David San Antonio on 9/3/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct GameCell: View {
    @EnvironmentObject var manager: Manager
    
    var cell: KakuroPuzzleCell
    var row: Int
    var col: Int
    
    var body: some View {
        if self.cell.bwSpace! == .black {
            return AnyView(EmptyEdge())
        } else if self.cell.answer != nil {
            let cell = InputSquare(id: (row, col))
                .environmentObject(self.manager)
            return AnyView(cell)
        } else {
            return AnyView(ClueEdge(bottomNumber: self.cell.bottomNumber, topNumber: self.cell.topNumber))
        }
    }
}

struct GameCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameCell(cell: KakuroPuzzleCell(topNumber: 5, bottomNumber: 17, answer: nil, bwSpace: .white), row: 0, col: 0)
            GameCell(cell: KakuroPuzzleCell(topNumber: 6, bottomNumber: nil, answer: nil, bwSpace: .white), row: 0, col: 0)
            GameCell(cell: KakuroPuzzleCell(topNumber: nil, bottomNumber: 9, answer: nil, bwSpace: .white), row: 0, col: 0)
            GameCell(cell: KakuroPuzzleCell(topNumber: nil, bottomNumber: nil, answer: nil, bwSpace: .black), row: 0, col: 0)
            GameCell(cell: KakuroPuzzleCell(topNumber: nil, bottomNumber: nil, answer: 6, bwSpace: .white), row: 0, col: 0)
        }
        .environmentObject(Manager())
        .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
    }
}
