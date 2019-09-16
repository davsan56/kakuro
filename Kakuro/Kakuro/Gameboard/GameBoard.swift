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
            PuzzleBoard()
            
            Button(action: { print("Validate results: \(self.manager.validateInputAnswers())") }) {
                Text("Validate")
            }
                .padding(.top, 25)
            
            NumberInputBar()
                .padding(.top, 25)
                .environmentObject(self.manager)
        }
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard()
        .environmentObject(Manager())
    }
}
