//
//  InputSquare.swift
//  Kakuro
//
//  Created by David San Antonio on 8/20/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct InputSquare: View {
    @EnvironmentObject var manager: Manager
    @State private var currentValue: Int = 0
    
    var id: (Int, Int)
    var size: CGFloat = 50
    
    var body: some View {
        // Have to hit enter for now to make numbers show up
        // TODO: should be a better way..
        TextField("", value: $currentValue, formatter: NumberFormatter(), onEditingChanged: { (isChanged) in

        }) {
            // Editing commited, gross syntax
            print(self.id)
            
            // TODO: probably not do this here, where's best?
            if self.manager.inputAnswers == nil {
                if let puzzleSize = self.manager.puzzles?.count {
                    self.manager.initialize(size: puzzleSize)
                }
            }
            self.manager.inputAnswers?[self.id.0][self.id.1] = self.currentValue
        }
            .keyboardType(.numberPad)
            //.foregroundColor(manager.selectedCell ?? (-1, -1) == id ? .gray : .white)
            .frame(width: size, height: size, alignment: .center)
            .border(Color.black, width: 0.5)
            .background(self.manager.selectedCell ?? (-1, -1) == self.id ? Color.blue.opacity(0.5) : Color.white)
            .multilineTextAlignment(.center)
            .onTapGesture {
                self.manager.selectedCell = self.id
            }
    }
}

#if DEBUG
struct InputSquare_Previews: PreviewProvider {
    static var previews: some View {
        InputSquare(id: (0, 0))
            .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
            .environmentObject(Manager())
    }
}
#endif
