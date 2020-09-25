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
    @State private var showingAlert = false
    @State private var winningAlert = false
    
    var body: some View {
        VStack {
            PuzzleBoard(cellStore: self.manager.cellStore ?? GamecellStore())
             
            HintBar()
            
            NumberInputBar()
        }
        .onAppear(perform: {
            Manager.shared.gameBoard = self
        })
        .environmentObject(self.manager)
        .alert(isPresented: $showingAlert) {
            if winningAlert {
                return Alert(title: Text("Congrats!"),
                             message: Text("You solved the puzzle. Would you like to play again?"),
                             primaryButton: .default(Text("Yes"), action: {
                                // some sort of restart here
                             }),
                             secondaryButton: .cancel()
                        )
            } else {
                return Alert(title: Text("Oops!"),
                             message: Text("Something isn't right"),
                             dismissButton: .default(Text("Ok"))
                        )
            }
        }
    }
    
    func showAlert(winner: Bool) {
        self.winningAlert = winner
        self.showingAlert = true
    }
}

struct GameBoard_Previews: PreviewProvider {
    static var previews: some View {
        GameBoard()
        .environmentObject(Manager())
    }
}
