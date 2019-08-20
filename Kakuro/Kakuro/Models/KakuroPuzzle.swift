//
//  KakuroPuzzle.swift
//  Kakuro
//
//  Created by Matt Berman on 8/20/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation

enum BlackWhiteSpace {
    case black
    case white
}

struct KakuroPuzzle {
    var cells: [[KakuroPuzzleCell]]
    
    func printCells() {
        for i in 0 ..< cells.count {
            for j in 0 ..< cells[i].count {
                let cell = cells[i][j]
                print("location: [\(i), \(j)]")
                print("answer: \(cell.answer ?? 0)")
                print("bottomNumber: \(cell.bottomNumber ?? 0)")
                print("topNumber: \(cell.topNumber ?? 0)")
                print("bwSpace: \(String(describing: cell.bwSpace))")
            }
        }
    }
}

struct KakuroPuzzleCell {
    var topNumber: Int? = nil
    var bottomNumber: Int? = nil
    var answer: Int? = nil
    var bwSpace: BlackWhiteSpace?
}
