//
//  SudokuChecker.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/11/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class SudokuChecker: BaseProblem {
    
    func exec() {
        let inputString = """
        4 1 7 3 6 9 8 2 5
        6 3 2 1 5 8 9 4 7
        9 5 8 7 2 4 3 1 6
        8 2 5 4 3 7 1 6 9
        7 9 1 5 8 6 4 3 2
        3 4 6 9 1 2 7 5 8
        2 8 9 6 4 3 5 7 1
        5 7 3 2 9 1 6 8 4
        1 6 4 8 7 5 2 9 3
        """.split(separator: "\n").map { String($0).toIntArray()}
        inputString.debugPrint()
        print(isValidSudokuBrute(inputString))
        print(isValidSudoku(inputString))
    }
    
    func isValidSudokuBrute(_ input:[[Int]]) -> Bool {
        var seenNumbers = ["row":[[Int:Bool]](), "column":[[Int:Bool]]()]
        for _ in 0..<9 {
            seenNumbers["row"]!.append([Int:Bool]())
            seenNumbers["column"]!.append([Int:Bool]())
        }
        for subCubeV in 0..<3 {
            for subCubeH in 0..<3 {
                var cube = [[Int]]()
                var cubeSeenNumbers = [Int:Bool]()
                for i in 0..<3 {
                    cube.append([Int]())
                    for j in 0..<3 {
                        let row = i + subCubeV*3
                        let column = j + subCubeH*3
                        let number = input[row][column]
                        if cubeSeenNumbers[number, default:false] != false {
                            return false
                        }
                        cubeSeenNumbers[number] = true
                        if seenNumbers["row"]![row][number, default:false] != false {
                            return false
                        } else {
                            seenNumbers["row"]![row][number] = true
                        }
                        if seenNumbers["column"]![column][number, default:false] != false {
                            return false
                        } else {
                            seenNumbers["column"]![column][number] = true
                        }

                        cube[i].append(number)
                    }
                }
            }
        }
        return true
    }
    
    func isValidSudoku(_ input:[[Int]]) -> Bool {
        var rowsNumbers = Array(repeating: 0, count: 9)
        var columnsNumbers = Array(repeating: 0, count:9)
        var squares = Array(repeating: 0, count: 9)
        
        for i in 0..<input.count {
            for j in 0..<input[0].count {
                let number = input[i][j]
                let shift = 1 << (number - 1)
                if rowsNumbers[i] & shift > 0 {
                    return false
                }
                rowsNumbers[i] = rowsNumbers[i] | shift
                if columnsNumbers[j] & shift > 0 {
                    return false
                }
                columnsNumbers[j] = columnsNumbers[j] | shift
                
                if squares[3*(i/3) + j/3] & shift > 0 {
                    return false
                }
                squares[3*(i/3) + j/3] = squares[3*(i/3) + j/3] | shift
            }
        }
        return true
    }
}
