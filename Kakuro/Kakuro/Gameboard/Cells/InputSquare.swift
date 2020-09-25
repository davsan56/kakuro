//
//  InputSquare.swift
//  Kakuro
//
//  Created by David San Antonio on 8/20/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct InputSquare: View, Equatable {
    @EnvironmentObject var manager: Manager
    @State private var currentValue: Int = 0
    @ObservedObject var info: GamecellType
    
    //TODO: Probably make this part of color extension, but couldnt figure it out
    let lightBlue = Color(red: 173 / 255, green: 216 / 255, blue: 230 / 255)
    
    var id: (Int, Int)
    var size: CGFloat = 50
    
    var body: some View {
        TextField("", text: .constant(toDisplay()), onEditingChanged: { _ in
            // Gets rid of everything that makes it act like a textfield.. feels gross
            UIApplication.shared.windows.forEach({$0.endEditing(true)})
        }) {
            // Stuff in here wasn't getting called so I moved it to the tap gesture
        }
        .keyboardType(.numberPad)
        .frame(width: size, height: size, alignment: .center)
        .border(Color.black, width: 0.5)
        .background(getBackgroundColor())
        .multilineTextAlignment(.center)
        .onTapGesture {
            self.manager.selectedCell = self
            
            // Reset this so if you click on a red cell it wont be red
            // Maybe we dont want this in the future, depending if we change
            // The what happens in the UI when a cell is selected
            self.info.isIncorrect = false
            
            // TODO: probably not do this here, where's best?
            // TODO: yeah idk what this does lol
            if self.manager.inputAnswers == nil {
                if let puzzleSize = self.manager.puzzles?.count {
                    self.manager.initialize(size: puzzleSize)
                }
            }
            self.manager.inputAnswers?[self.id.0][self.id.1] = self.currentValue
        }
    }
    
    private func getBackgroundColor() -> Color {
        if self.manager.selectedCell == self {
            if self.info.isIncorrect {
                return Color.red
            } else {
                return lightBlue
            }
        } else {
            if self.info.isIncorrect {
                return Color.red
            } else {
                return Color.white
            }
        }
    }
    
    private func toDisplay() -> String {
        return self.currentValue == 0 ? "" : String(self.currentValue)
    }
    
    func setText(num: Int) {
        self.currentValue = num
        self.info.isIncorrect = false
        self.info.currentNumber = num
    }
    
    static func == (lhs: InputSquare, rhs: InputSquare) -> Bool {
        return lhs.id == rhs.id
    }
}

struct InputSquare_Previews: PreviewProvider {
    static var previews: some View {
        InputSquare(info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(topNumber: 0, bottomNumber: 0, answer: 0, bwSpace: .white), currentNumber: 0), id: (0, 0))
            .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
            .environmentObject(Manager())
    }
}
