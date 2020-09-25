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
    
    @ViewBuilder
    var body: some View {
        ZStack {
            if let bottomNumber = bottomNumber {
                Path { path in
                    path.move(to: CGPoint(x: offset, y: offset))
                    path.addLine(to: CGPoint(x: offset, y: size))
                    path.addLine(to: CGPoint(x: size - (offset * 2), y: size))
                }
                .foregroundColor(getBackgroundColor(top: false))
                Text(String(bottomNumber))
                    .position(x: CGFloat(size / 4), y: CGFloat(Double(size) / 1.5))
            }
            
            if let topNumber = topNumber {
                Path { path in
                    path.move(to: CGPoint(x: offset * 2, y: offset))
                    path.addLine(to: CGPoint(x: size - offset, y: offset))
                    path.addLine(to: CGPoint(x: size - offset, y: size))
                }
                .foregroundColor(getBackgroundColor(top: true))
                Text(String(topNumber))
                    .position(x: CGFloat(Double(size) / 1.5), y: CGFloat(size / 4))
            }
        }
        .frame(width: CGFloat(size), height: CGFloat(size), alignment: .center)
        .background(Color.black)
    }
    
    /// This function determines what the background color should be for a clue cell
    /// ie green for numbers add up, red for numbers that down add up, gray otherwise
    ///
    /// TODO: This doesn't work, the background color doesn't change, I think it needs to be
    /// a state variable, but idk how that variable will will get updated.
    /// On every edit of a cell that is part of this edge? I think thats what I was going for here.
    ///
    /// This might work, just need to trigger it on every cell edit
    ///
    /// - Parameter top: Does this cell have a top number
    /// - Returns: The background color
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
    
    /// This function goes through all the cells in the board and determines if the current
    /// clue edge "owns" thiat cell.
    /// - Parameters:
    ///   - vertical: If the cell points vertically or horizontally
    ///   - directionalCell: The cell
    /// - Returns: An array of cells that this clue edge owns
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
    
    /// This function determines the color that a clue edge should be based on the
    /// sum of the value of the cells that this edge owns
    /// - Parameters:
    ///   - totalNumber: number in the clue edge
    ///   - inputCellsToEdge: all the cells that this clue edge owns
    /// - Returns: the color that the background should be
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

struct ClueEdge_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ClueEdge(bottomNumber: 43,
                     topNumber: 7,
                     info: GamecellType(row: 0, col: 0, cell: KakuroPuzzleCell(), currentNumber: 0)
                    )
        }
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
