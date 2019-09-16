//
//  Gameboard.swift
//  Kakuro
//
//  Created by David San Antonio on 9/3/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct PuzzleBoard: View {
    @EnvironmentObject var manager: Manager

    // TODO: make pretty, no more explicitly unwrapped, data binding, save the planet
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0 ..< self.manager.puzzles!.count) { row in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0 ..< self.manager.puzzles![row].count) { column in
                        GameCell(cell: self.manager.puzzles![row][column], row: row, col: column)
                            .environmentObject(self.manager)
                    }
                }
            }
        }
        .padding()
        .background(Color.black)
        .border(Color.black, width: 10)
        .cornerRadius(20)
    }
}

#if DEBUG
struct PuzzleBoard_Previews: PreviewProvider {
    static var previews: some View {
        PuzzleBoard()
        .environmentObject(Manager())
    }
}
#endif
