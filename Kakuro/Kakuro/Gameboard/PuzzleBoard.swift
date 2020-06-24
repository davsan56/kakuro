//
//  PuzzleBoard.swift
//  Kakuro
//
//  Created by David San Antonio on 9/3/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct PuzzleBoard: View {
    @EnvironmentObject var manager: Manager
    
    let cellStore: GamecellStore

    // TODO: make pretty, no more explicitly unwrapped, data binding, save the planet
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(0 ..< self.cellStore.cells.count) { row in
                HStack(alignment: .center, spacing: 0) {
                    ForEach(0 ..< self.cellStore.cells[row].count) { column in
                        GameCell(info: self.cellStore.cells[row][column])
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
        PuzzleBoard(cellStore: GamecellStore())
        .environmentObject(Manager())
    }
}
#endif
