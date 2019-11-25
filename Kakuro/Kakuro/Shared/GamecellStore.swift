//
//  GamecellStore.swift
//  Kakuro
//
//  Created by David San Antonio on 11/24/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation

class GamecellStore {
    var cells: [[GamecellType]] = [[]]
    
    init() {
        guard let puzzle = Manager.shared.puzzles else {
            fatalError("yeah idk")
        }
        var rowCount = 0
        var colCount = 0
        for row in puzzle {
            colCount = 0
            var aRow: [GamecellType] = []
            for cell in row {
                aRow.append(GamecellType(row: rowCount, col: colCount, cell: cell, currentNumber: 0))
                colCount += 1
            }
            cells.append(aRow)
            rowCount += 1
        }
    }
}
