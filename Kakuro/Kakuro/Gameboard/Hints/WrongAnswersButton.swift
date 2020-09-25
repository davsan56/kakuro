//
//  WrongAnswersButton.swift
//  Kakuro
//
//  Created by David San Antonio on 9/28/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct WrongAnswersButton: View {
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        Button(action: {
            self.manager.highLightWrongCells()
        }) {
            Image(systemName: "magnifyingglass")
        }
    }
}

struct WrongAnswersButton_Previews: PreviewProvider {
    static var previews: some View {
        WrongAnswersButton()
            .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
            .environmentObject(Manager())
    }
}
