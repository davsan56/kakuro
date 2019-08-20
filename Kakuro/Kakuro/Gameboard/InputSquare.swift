//
//  InputSquare.swift
//  Kakuro
//
//  Created by David San Antonio on 8/20/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct InputSquare: View {
    var size: CGFloat = 50
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size, alignment: .center)
            .foregroundColor(.clear)
            .border(Color.black)
    }
}

struct InputSquare_Previews: PreviewProvider {
    static var previews: some View {
        InputSquare()
            .previewLayout(PreviewLayout.fixed(width: 100, height: 100))
    }
}
