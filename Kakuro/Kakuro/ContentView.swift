//
//  ContentView.swift
//  Kakuro
//
//  Created by David San Antonio on 8/16/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        VStack {
            Gameboard()
        }
        .environmentObject(manager)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Manager())
    }
}
#endif
