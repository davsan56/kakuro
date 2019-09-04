//
//  Gameboard.swift
//  Kakuro
//
//  Created by David San Antonio on 9/3/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct Gameboard: View {
    @EnvironmentObject var manager: Manager
    
    // TODO: not this..
    let puzzles = PuzzleLoader.shared.loadPuzzles(filename: "puzzle1")?.cells
    
    // TODO: make pretty, no more explicitly unwrapped, data binding, save the planet
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0 ..< self.puzzles!.count) { row in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0 ..< self.puzzles![row].count) { column in
                        GameCell(cell: self.puzzles![row][column], row: row, col: column)
                            .environmentObject(self.manager)
                    }
                }
            }
        }
    }
}

struct Gameboard_Previews: PreviewProvider {
    static var previews: some View {
        Gameboard()
        .environmentObject(Manager())
    }
}
