//
//  ArrayDSHourglassSum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/24/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description  - https://www.hackerrank.com/challenges/2d-array/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays
 */

import Foundation

class ArrayDSHourglassSum {
    static let pattern = [[1,1,1],[0,1,0],[1,1,1]]
    static let array = [[-9, -9, -9, 1, 1, 1],
                        [0, -9,  0, 4, 3, 2],
                        [-9, -9, -9, 1, 2, 3],
                        [0, 0, 8, 6, 6, 0],
                        [0, 0, 0, -2, 0, 0],
                        [0, 0, 1,  2, 4, 0]]
    
    class func exec() {
        print(getMaxHourglassSum(array))
    }
    
    class func getMaxHourglassSum(_ array:[[Int]]) -> Int {
        let horizontalPatternsCount = array.count - pattern.first!.count + 1
        let verticalPatternCount = array.count - pattern.count + 1
        var hourglassesSums = Array(repeating: Array(repeating: 0, count: horizontalPatternsCount), count: verticalPatternCount)
        var topLeftPointer = (i:0, j:0)
        for _ in 0..<verticalPatternCount { //
            for _ in 0..<horizontalPatternsCount {
                var sum = 0
                for pi in 0..<pattern.count {
                    for pj in 0..<pattern[pi].count {
                        if pattern[pi][pj] == 1 {
                            print(pi + topLeftPointer.i, pj + topLeftPointer.j)
                            sum += array[pi + topLeftPointer.i][pj + topLeftPointer.j]
                        }
                    }
                }
                hourglassesSums[topLeftPointer.i][topLeftPointer.j] = sum
                topLeftPointer.j += 1
            }
            topLeftPointer.j = 0
            topLeftPointer.i += 1
        }
        return hourglassesSums.compactMap { array in
            return array.max(by: <)
        }.max(by: <)!
    }
}
