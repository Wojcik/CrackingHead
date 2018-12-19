//
//  KnightTour.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/12/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

fileprivate enum Grid : Int {
    case Size = 8
}

class KnightTour: BaseProblem {
    let moveX = [2, 1, -1, -2, -2, -1,  1,  2]
    let moveY = [1, 2,  2,  1, -1, -2, -2, -1]
    var grid = Array(repeating: Array(repeating: -1, count: Grid.Size.rawValue), count: Grid.Size.rawValue)

    func exec() {
        knightTour()
    }
    
    func knightTour() {
        grid[0][0] = 0
        if fillGrid(&grid, startX:0, startY:0, moveId: 1) {
            grid.debugPrint()
        } else {
            print("No possible solutions")
        }
    }
    
    func fillGrid(_ grid:inout [[Int]], startX:Int, startY:Int, moveId:Int) -> Bool {
        if moveId == Grid.Size.rawValue*Grid.Size.rawValue {
            return true
        }

        for possibleMove in 0..<8 {
            let nextX = startX + moveX[possibleMove]
            let nextY = startY + moveY[possibleMove]
            if isValidPosition(x: nextX, y: nextY, grid:grid) {
                grid[nextX][nextY] = moveId
                if fillGrid(&grid, startX: nextX, startY: nextY, moveId: moveId + 1){
                    return true
                } else {
                    grid[nextX][nextY] = -1
                }
            }

        }
        return false
    }
    
    func isValidPosition(x:Int, y:Int, grid:[[Int]]) -> Bool {
        return y >= 0 && x >= 0 && y < Grid.Size.rawValue && x < Grid.Size.rawValue && grid[x][y] == -1
    }
}
