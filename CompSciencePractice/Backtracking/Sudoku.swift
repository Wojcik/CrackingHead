//
//  Sudoku.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/12/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Sudoku: BaseProblem {
    let sudokuChecker = SudokuChecker()
    
    func exec() {
        var grid = Array(repeating: Array(repeating: -1, count: 9), count: 9)
        buildSudoku(grid)
        grid.debugPrint()
    }
    
    func buildSudoku(_ grid:[[Int]]) -> Bool {
        var grid = grid
        grid.debugPrint()
        guard let unasigned = findUnassigned(grid) else {
            grid.debugPrint()
            return true
        }
        for i in 1...9 {
            grid[unasigned.i][unasigned.j] = i
            if sudokuChecker.isValidSudoku(grid) {
                if buildSudoku(grid) {
                    return true
                } else {
                    grid[unasigned.i][unasigned.j] = -1
                }
            } else {
                grid[unasigned.i][unasigned.j] = -1
            }
        }
        return false
    }
    
    func findUnassigned(_ grid:[[Int]]) -> (i:Int, j:Int)? {
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == -1 {
                    return (i:i, j:j)
                }
            }
        }
        return nil
    }
}
