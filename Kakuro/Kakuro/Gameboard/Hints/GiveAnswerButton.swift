//
//  GiveAnswerButton.swift
//  Kakuro
//
//  Created by David San Antonio on 11/28/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct GiveAnswerButton: View {
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        Button(action: {
            self.manager.giveAnswer()
        }) {
            Image(systemName: "star.circle")
        }
    }
}

struct GiveAnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        GiveAnswerButton()
            .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
            .environmentObject(Manager())
    }
}
