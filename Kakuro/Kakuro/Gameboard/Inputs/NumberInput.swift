//
//  NumberInput.swift
//  Kakuro
//
//  Created by David San Antonio on 9/10/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct NumberInput: View {
    @EnvironmentObject var manager: Manager
    
    var number: Int
    
    var body: some View {
        Button(action: {
            self.manager.selectedCell?.setText(num: self.number)
            
            // Check for game over
            self.manager.checkForGameOver()
        }) {
            Text(String(number))
                .foregroundColor(.black)
        }
        .padding(10)
        .border(Color.black)
    }
}

#if DEBUG
struct NumberInput_Previews: PreviewProvider {
    static var previews: some View {
        NumberInput(number: 8)
            .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
            .environmentObject(Manager())
    }
}
#endif
