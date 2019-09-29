//
//  NumberInputBar.swift
//  Kakuro
//
//  Created by David San Antonio on 9/10/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct NumberInputBar: View {
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        HStack {
            ForEach(1 ..< 10) { i in
                NumberInput(number: i)
                    .environmentObject(self.manager)
            }
        }
        .padding(.top, 25)
    }
}

#if DEBUG
struct NumberInputBar_Previews: PreviewProvider {
    static var previews: some View {
        NumberInputBar()
        .environmentObject(Manager())
    }
}
#endif
