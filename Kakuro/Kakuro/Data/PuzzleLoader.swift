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
                let puzzle = try decoder.decode(KakuroPuzzle.self, from: data)
                let valid = puzzle.validateData()
                if !valid {
                    return nil
                }
                return puzzle
            }
            catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}

