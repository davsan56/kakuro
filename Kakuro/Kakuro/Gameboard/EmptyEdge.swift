//
//  EmptyEdge.swift
//  Kakuro
//
// Maybe eventually instead of being completely black
// the squares could be invisible?
//
//  Created by David San Antonio on 8/19/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct EmptyEdge: View {
    var body: some View {
        // Will probably have to vary the sizes based on size of board
        Rectangle()
            .frame(width: 50, height: 50, alignment: .center)
    }
}

#if DEBUG
struct EmptyEdge_Previews: PreviewProvider {
    static var previews: some View {
        EmptyEdge()
    }
}
#endif
