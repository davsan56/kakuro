//
//  ClueEdge.swift
//  Kakuro
//
//  Created by David San Antonio on 8/20/19.
//  Copyright © 2019 PPC. All rights reserved.
//

import SwiftUI

struct ClueEdge: View {
    var bottomNumber: Int?
    var topNumber: Int?
    @ObservedObject var info: GamecellType
    
    var size: Double = 50
    var offset: Double = 0.5
    
    var body: some View {
        ZStack {
            // Cant use if let here because swiftui
            if (bottomNumber != nil) {
                Path { path in
                    path.move(to: CGPoint(x: offset, y: offset))
                    path.addLine(to: CGPoint(x: offset, y: size))
                    path.addLine(to: CGPoint(x: size - (offset * 2), y: size))
                }
                .foregroundColor(getBackgroundColor(top: false))
                // ! is fine because we checked it in the if
                Text(String(bottomNumber!))
                    .position(x: CGFloat(size / 4), y: CGFloat(Double(size) / 1.5))
            }
            
            // Cant use if let here because swiftui
            if (topNumber != nil) {
                Path { path in
                    path.move(to: CGPoint(x: offset * 2, y: offset))
                    path.addLine(to: CGPoint(x: size - offset, y: offset))
                    path.addLine(to: CGPoint(x: size - offset, y: size))
                }
                .foregroundColor(getBackgroundColor(top: true))
                Text(String(topNumber!))
                    .position(x: CGFloat(Double(size) / 1.5), y: CGFloat(size / 4))
            }
        }
        .frame(width: CGFloat(size), height: CGFloat(size), alignment: .center)
        .background(Color.black)
    }
    
    private func getBackgroundColor(top: Bool) -> Color {
        if top, let topNumber = self.topNumber {
            let inputCellsToEdge = getCellsThatArePartOfThisEdge(vertical: !top, directionalCell: info)
            return getColorFromSumOfInputCells(totalNumber: topNumber, inputCellsToEdge: inputCellsToEdge)
        } else if let bottomNumber = self.bottomNumber {
            let inputCellsToEdge = getCellsThatArePartOfThisEdge(vertical: !top, directionalCell: info)
            return getColorFromSumOfInputCells(totalNumber: bottomNumber, inputCellsToEdge: inputCellsToEdge)
        } else {
            return .gray
        }
    }
    
    private func getCellsThatArePartOfThisEdge(vertical: Bool, directionalCell: GamecellType) -> [GamecellType] {
        guard let cells = Manager.shared.cellStore?.cells else {
            fatalError("Manager should have cells")
        }
        // The array of cells that is part of the edge
        var directionalArray = [GamecellType]()
        // For each row
        for row in cells {
            // For each cell in the row
            for cell in row {
                // Add cell in column or row to array
                if vertical {
                    if cell.col == directionalCell.col {
                        directionalArray.append(cell)
                    }
                } else {
                    if cell.row == directionalCell.row {
                        directionalArray.append(cell)
                    }
                }
            }
        }
        
        // Get rid of cells before the edge
        if vertical {
            directionalArray = directionalArray.filter { $0.row > directionalCell.row }
        } else {
            directionalArray = directionalArray.filter { $0.col > directionalCell.col }
        }
        
        // The array of input cells that belong to the clue edge
        var inputCellsToEdge = [GamecellType]()
        // Loop over column or row cells after edge
        for cell in directionalArray {
            // If it is an input square
            if cell.cell.answer != nil {
                // If it is beneath the edge
                if vertical {
                    if cell.row > directionalCell.row {
                        inputCellsToEdge.append(cell)
                    }
                } else {
                    if cell.col > directionalCell.col {
                        inputCellsToEdge.append(cell)
                    }
                }
            } else {
                // We've hit a non input cell, so stop
                break
            }
        }
        
        return inputCellsToEdge
    }
    
    private func getColorFromSumOfInputCells(totalNumber: Int, inputCellsToEdge: [GamecellType]) -> Color {
        // Check if the input cells add up to the clue edge
        var sum = 0
        for cell in inputCellsToEdge {
            // If the cell value is 0, it hasn't been filled in yet
            // So keep edge gray
            if cell.currentNumber == 0 {
                return .gray
            } else {
                sum += cell.currentNumber
            }
        }
        
        // If the sum of the cells is the same as the clue edge number
        if sum == totalNumber {
            // The users inputted numbers add up correctly
            // Does not mean the answers are right
            return .green
        } else {
            // The users inputted numbers do not add up correctly
            return .red
        }
    }
}

#if DEBUG
struct ClueEdge_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClueEdge(bottomNumber: 43, topNumber: 7,
                     info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(), currentNumber: 0)
                     )
//            ClueEdge(bottomNumber: 5, bottomCell: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(), currentNumber: 0))
//            ClueEdge(topNumber: 32, topCell: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(), currentNumber: 0))
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
#endif
