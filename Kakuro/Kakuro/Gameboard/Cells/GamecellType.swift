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
    var didChange = PassthroughSubject<GamecellType, Never>()

    let id = UUID()
    var row: Int {
        didSet {
            self.didChange.send(self)
        }
    }
    var col: Int {
        didSet {
            self.didChange.send(self)
        }
    }
    var cell: KakuroPuzzleCell {
        didSet {
            self.didChange.send(self)
        }
    }
    @Published var currentNumber: Int {
        didSet {
            self.didChange.send(self)
        }
    }
    @Published var isIncorrect: Bool {
        didSet {
            self.didChange.send(self)
        }
    }

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

