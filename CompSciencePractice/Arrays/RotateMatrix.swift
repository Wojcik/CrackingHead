//
//  RotateMatrix.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/20/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class RotateMatrix: BaseProblem {
    func exec() {
        var matrix = [[1,2,3,4],[12,13,14,5],[11,16,15,6],[10,9,8,7]]
        print(matrix.debugPrint())
        print(rotate(matrix: &matrix))
        print(matrix.debugPrint())
    }
    
    func rotate(matrix:inout [[Int]]) -> Bool {
        guard !matrix.isEmpty && matrix.count == matrix.first?.count else {
            return false
        }
        let layersCount = matrix.count / 2
        
        for layer in 0..<layersCount {
            let first = layer
            let last = matrix.count - layer - 1
            for i in first..<last {
                let top = matrix[first][i]
                let offset = i - first
                //left to top
                matrix[first][i] = matrix[last - offset][first]
                //bottom to left
                matrix[last - offset][first] = matrix[last][last - offset]
                //left to bottom
                matrix[last][last - offset] = matrix[i][last]
                //top to left
                matrix[i][last] = top
            }
            
        }
        return true
    }
}

