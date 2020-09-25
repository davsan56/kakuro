//
//  GamecellType.swift
//  Kakuro
//
//  Created by David San Antonio on 11/24/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI
import Combine

class GamecellType: ObservableObject, Identifiable, CustomStringConvertible {

    let id = UUID()
    
    @Published var row: Int
    @Published var col: Int
    @Published var cell: KakuroPuzzleCell
    @Published var currentNumber: Int
    @Published var isIncorrect: Bool

    init(row: Int, col: Int, cell: KakuroPuzzleCell, currentNumber: Int) {
        self.row = row
        self.col = col
        self.cell = cell
        self.currentNumber = currentNumber
        self.isIncorrect = false
    }
    
    var description: String {
      return "GamecellType (\(row), \(col)) : num = \(currentNumber)"
    }
}

