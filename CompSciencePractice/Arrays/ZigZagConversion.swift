//
//  ZigZagConversion.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/17/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class ZigZagConversion: BaseProblem {
    func exec() {
        let input = "AB"
        print(convert(input, 1))
    }
    
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        var rows = Array(repeating:[Character](), count:numRows)
        let input = Array(s)
        var direction = 1
        var currentRow = 0
        for character in input {
            rows[currentRow].append(character)
            currentRow += direction
            if currentRow == numRows - 1 || currentRow == 0 {
                direction = direction == 1 ? -1 : 1
            }
        }
        
        var output = ""
        for row in rows {
            output += row
        }
        return output
    }
}
