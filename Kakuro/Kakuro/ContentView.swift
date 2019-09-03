//
//  ContentView.swift
//  Kakuro
//
//  Created by David San Antonio on 8/16/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var manager: Manager
    
    // TODO: not this..
    let puzzles = PuzzleLoader.shared.loadPuzzles(filename: "puzzle1")?.cells
    
    // TODO: make pretty, no more explicitly unwrapped, data binding, save the planet
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0 ..< self.puzzles!.count) { row in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0 ..< self.puzzles![row].count) { column in
                        if self.puzzles![row][column].bwSpace! == .black {
                            EmptyEdge()
                        } else if self.puzzles![row][column].answer != nil {
                            InputSquare(id: (row, column))
                                .environmentObject(self.manager)
                        } else {
                            ClueEdge(bottomNumber: self.puzzles![row][column].bottomNumber, topNumber: self.puzzles![row][column].topNumber)
                        }
                    }

                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Manager())
    }
}
#endif
