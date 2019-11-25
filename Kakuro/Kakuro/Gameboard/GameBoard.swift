//
//  GameBoard.swift
//  Kakuro
//
//  Created by David San Antonio on 9/16/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct GameBoard: View {
    
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        VStack {
            PuzzleBoard(cellStore: self.manager.cellStore ?? GamecellStore())
             
            HintBar()
            
            NumberInputBar()
        }
        .environmentObject(self.manager)
    }
}

#if DEBUG
struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard()
        .environmentObject(Manager())
    }
}
#endif
