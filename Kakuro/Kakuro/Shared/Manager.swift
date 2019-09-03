//
//  Manager.swift
//  Kakuro
//
//  Created by David San Antonio on 9/3/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import Foundation
import SwiftUI

class Manager: ObservableObject {
    @Published var selectedCell: (Int, Int)?
}
