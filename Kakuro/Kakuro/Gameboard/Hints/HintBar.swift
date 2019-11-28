//
//  HintBar.swift
//  Kakuro
//
//  Created by David San Antonio on 9/28/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct HintBar: View {
    @EnvironmentObject var manager: Manager
    
    var body: some View {
        HStack {
            WrongAnswersButton()
            GiveAnswerButton()
        }
        .environmentObject(self.manager)
        .padding(.top, 25)
    }
}

#if DEBUG
struct HintBar_Previews: PreviewProvider {
    static var previews: some View {
        HintBar()
        .environmentObject(Manager())
    }
}
#endif
