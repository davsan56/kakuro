//
//  PuzzleLoader.swift
//  Kakuro
//
//  Created by Matt Berman on 8/16/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation

class PuzzleLoader {
    
    static let shared = PuzzleLoader()
    let fileExtension = "json"
    
    // Load local JSON file for initial tests
    func loadPuzzles(filename: String) -> KakuroPuzzle? {
        if let url = Bundle.main.url(forResource: filename, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let puzzleData = try decoder.decode(KakuroPuzzleData.self, from: data)
                let valid = puzzleData.validateData()
                if !valid {
                    print("Invalid JSON")
                    return nil
                }
                let converted = convertPuzzle(puzzleData: puzzleData)
                //converted.printCells()
                return converted
            }
            catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    // Convert puzzle data to model cell array
    private func convertPuzzle(puzzleData: KakuroPuzzleData) -> KakuroPuzzle {
        let puzzleData = puzzleData.puzzle
        var allCells = [[KakuroPuzzleCell]]()
        
        for i in 0 ..< puzzleData.count {
            
            var cellRow = [KakuroPuzzleCell]()
            
            for j in 0 ..< puzzleData[i].count {
                var cell = KakuroPuzzleCell()
                let cellData: String = puzzleData[i][j]
                cell.bwSpace = (cellData == "b" ? .black : .white)
                
                if cellData.starts(with: "w|") {
                    let cellDataParts = cellData.split(separator: "|")
                    cell.answer = Int(cellDataParts[1])
                }
                
                else {
                    let cellDataParts = cellData.split(separator: "|")
                    // Either |# or #|
                    if cellDataParts.count == 1 {
                        if cellData.starts(with: "|") {
                            cell.bottomNumber = Int(cellDataParts[0])
                        }
                        else {
                            cell.topNumber = Int(cellDataParts[0])
                        }
                    }
                    // #|#
                    else {
                        cell.topNumber = Int(cellDataParts[0])
                        cell.bottomNumber = Int(cellDataParts[1])
                    }
                }
                cellRow.append(cell)
            }
            allCells.append(cellRow)
        }
        return KakuroPuzzle(cells: allCells)
    }
}

