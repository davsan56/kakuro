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
    
    var id: (Int, Int)
    var size: CGFloat = 50
    
    var body: some View {
        Rectangle()
            .foregroundColor(manager.selectedCell ?? (-1, -1) == id ? .blue : .white)
            .border(Color.black)
            .onTapGesture {
                self.manager.selectedCell = self.id
            }
            .frame(width: size, height: size, alignment: .center)
    }
}

struct InputSquare_Previews: PreviewProvider {
    static var previews: some View {
        InputSquare(id: (0, 0))
            .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
            .environmentObject(Manager())
    }
}
