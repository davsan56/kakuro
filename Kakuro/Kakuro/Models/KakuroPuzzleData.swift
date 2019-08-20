//
//  KakuroPuzzle.swift
//  Kakuro
//
//  Created by Matt Berman on 8/16/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation

typealias PuzzleData = [[String]]

struct KakuroPuzzleData: Decodable {
    var puzzle: PuzzleData
    
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
        // w|# = white/answer usable space
        // #|#, #|, |# = split space, # can be empty
        for row in puzzle {
            for element in row {
                
                // Continue early, good symbol
                if element == "b" {
                    continue
                }
                
                // Check for answer tile format, w|##
                let range = NSRange(location: 0, length: element.utf8.count)
                if element.starts(with: "w|") {
                    let regex = try! NSRegularExpression(pattern: #"w|(\d+)"#)
                    let match = regex.firstMatch(in: element, options: [], range: range) != nil
                    if !match {
                        return false
                    }
                }
                
                // Check for x|x pattern
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
