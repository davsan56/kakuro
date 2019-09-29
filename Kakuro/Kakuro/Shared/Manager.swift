//
//  Manager.swift
//  Kakuro
//
//  Created by David San Antonio on 9/3/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation
import SwiftUI

class Manager: ObservableObject {
    static let shared = Manager()
    @Published var selectedCell: InputSquare?
    @Published var puzzles = PuzzleLoader.shared.loadPuzzles(filename: "puzzle1")?.cells
    @Published var inputAnswers: [[Int]]? = nil
    // This was the part that didnt work. I could never add an inputsquare to the array
//    @Published var inputCells: [InputSquare] = []
    
    // Pretty printer for the data
    func printInputAnswers() {
        guard let puzzle = puzzles else { return }
        
        for i in 0 ..< puzzle.count {
            for j in 0 ..< puzzle[i].count {
                if let answers = inputAnswers?[i][j], answers != -1 {
                    print("(\(i), \(j)): \(answers)")
                }
            }
        }
    }
    
    // TODO: Better way to do this?
    // nils gets nasty in 2-d array when unwrap chaining
    func initialize(size: Int) {
        var allEmpty = [[Int]]()
        for _ in 0 ..< size {
            var emptyRow = [Int]()
            for _ in 0 ..< size {
                emptyRow.append(-1)
            }
            allEmpty.append(emptyRow)
        }
        self.inputAnswers = allEmpty
    }
    
    func highLightWrongCells() {
        // TODO: Uh i was trying something like this but it didnt work
//        guard let puzzle = puzzles else { return }
//
//        // Get the wrong cells
//        var wrongCells: [(Int, Int)] = []
//        for i in 0 ..< puzzle.count {
//            for j in 0 ..< puzzle[i].count {
//                // Checks input against accepted answer
//                // Needs more logic?
//                if let inputAnswer = inputAnswers?[i][j],
//                let correctAnswer = puzzle[i][j].answer {
//                    if inputAnswer != correctAnswer && inputAnswer != -1 {
//                        wrongCells.append((i, j))
//                    }
//                }
//            }
//        }
//
//        // for all the wrong cells, highlight the matching input square
//        for id in wrongCells {
//            let cell = inputCells.first(where: {$0.id == id})
//            cell?.setBackgroundColor(color: .red)
//        }
    }
    
    // Check the current board input against known answers
    func validateInputAnswers() -> Bool {
        guard let puzzle = puzzles else { return false }

        for i in 0 ..< puzzle.count {
            for j in 0 ..< puzzle[i].count {
                // Checks input against accepted answer
                // Needs more logic?
                if let inputAnswer = inputAnswers?[i][j],
                    let correctAnswer = puzzle[i][j].answer {
                    if inputAnswer != correctAnswer {
                        return false
                    }
                }
            }
        }
        return true
    }
}
