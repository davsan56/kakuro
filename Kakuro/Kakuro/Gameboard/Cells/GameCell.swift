//
//  GameCell.swift
//  Kakuro
//
//  Created by David San Antonio on 9/3/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct GameCell: View {
    @EnvironmentObject var manager: Manager
    @ObservedObject var info: GamecellType
    
    @ViewBuilder
    var body: some View {
        if self.info.cell.bwSpace! == .black {
            EmptyEdge()
        } else if self.info.cell.answer != nil {
            InputSquare(info: info, id: (self.info.row, self.info.col))
                .environmentObject(self.manager)
        } else {
            ClueEdge(bottomNumber: self.info.cell.bottomNumber,
                     topNumber: self.info.cell.topNumber,
                     info: self.info
            )
        }
    }
}

struct GameCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameCell(info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(topNumber: 5, bottomNumber: 17, answer: nil, bwSpace: .white), currentNumber: 0))
            GameCell(info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(topNumber: 6, bottomNumber: nil, answer: nil, bwSpace: .white), currentNumber: 0))
            GameCell(info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(topNumber: nil, bottomNumber: 9, answer: nil, bwSpace: .white), currentNumber: 0))
            GameCell(info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(topNumber: nil, bottomNumber: nil, answer: nil, bwSpace: .black), currentNumber: 0))
            GameCell(info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(topNumber: nil, bottomNumber: nil, answer: nil, bwSpace: .white), currentNumber: 0))
        }
        .environmentObject(Manager())
        .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
    }
}
