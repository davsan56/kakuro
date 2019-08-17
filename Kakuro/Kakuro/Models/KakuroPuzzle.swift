//
//  KakuroPuzzle.swift
//  Kakuro
//
//  Created by Matt Berman on 8/16/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation

typealias PuzzleData = [[String]]

struct KakuroPuzzle: Decodable {
    var puzzle: PuzzleData
    let validSymbols = ["b", "w"]
    
    // Basic validator to make sure data format is okay
    func validateData() -> Bool {
        
        // Make sure it's not empty
        if puzzle.count == 0 {
            return false
        }
        
        // Make sure it's square
        if puzzle.count != puzzle[0].count {
            return false
        }
        
        // Make sure the data is in a valid format
        // Allowed formats are:
        // b = black/dead edge space
        // w = white/empty usable space
        // x|x = split space, x can be empty
        for row in puzzle {
            for element in row {
                
                // Continue early, these are good
                if validSymbols.contains(element) {
                    continue
                }
                
                // Check for x|x pattern
                let range = NSRange(location: 0, length: element.utf8.count)
                let regex = try! NSRegularExpression(pattern: #"(\d+)|(\d+)"#)
                let match = regex.firstMatch(in: element, options: [], range: range) != nil
                if !match {
                    return false
                }
                
                // TODO: check for junk data, i.e. 10|10b or other junk chars
            }
        }
        return true
    }
}
