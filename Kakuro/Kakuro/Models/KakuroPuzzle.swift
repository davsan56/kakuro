//
//  KakuroPuzzle.swift
//  Kakuro
//
//  Created by Matt Berman on 8/20/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation

struct KakuroPuzzle {
    var cells: [[KakuroPuzzleCell]]
    
    func printCells() {
        for i in 0 ..< cells.count {
            for j in 0 ..< cells[i].count {
                let cell = cells[i][j]
                print("location: [\(i), \(j)]")
                print("answer: \(cell.answer ?? 0)")
                print("blackSpace: \(cell.blackSpace ?? false)")
                print("bottomNumber: \(cell.bottomNumber ?? 0)")
                print("topNumber: \(cell.topNumber ?? 0)")
                print("whiteSpace: \(cell.whiteSpace ?? false)")
            }
        }
    }
}

struct KakuroPuzzleCell {
    var topNumber: Int? = nil
    var bottomNumber: Int? = nil
    var answer: Int? = nil
    var blackSpace: Bool? = false
    var whiteSpace: Bool? = false
}
