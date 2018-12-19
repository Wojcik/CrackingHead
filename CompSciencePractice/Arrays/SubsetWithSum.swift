//
//  SubsetWithSum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/3/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class SubsetWithSum: BaseProblem {
    func exec() {
        let array = [3, 2, 7, 1]
        let sum = 10
        subset(in: array, withSum: sum)
        print(findSubset(in: array, withSum: sum))
    }
    
    func subset(in array:[Int], withSum:Int) {
        var solution = Array(repeating: 0, count: array.count)
        subset(in: array, start: 0, currSum: 0, targetSum: withSum, solution: &solution)
    }
    
    // 2^n solution
    func subset(in array:[Int], start:Int, currSum:Int, targetSum:Int, solution: inout [Int]) {
        if currSum == targetSum {
            for (index, value) in solution.enumerated() {
                if value == 1 {
                    print(array[index])
                }
            }
            return
        } else if start == array.count {
            return
        }
        solution[start] = 1
        subset(in: array, start: start + 1, currSum: currSum + array[start], targetSum: targetSum, solution: &solution)
        solution[start] = 0
        subset(in: array, start: start + 1, currSum: currSum, targetSum: targetSum, solution: &solution)
        return
    }
    
    //dp solution
    
    func findSubset(in array:[Int], withSum sum:Int) -> [Int]? {
        var solution: [[Bool]] = []
        for _ in 0...array.count {
            var row = Array.init(repeating: false, count: sum + 1)
            row[0] = true
            solution.append(row)
        }
        
        for i in 1..<solution.count {
            var row = solution[i]
            for j in 1..<row.count {
                row[j] = solution[i-1][j]
                if row[j] == false && array[i - 1] <= j {
                    row[j] = solution[i - 1][j - array[i-1]]
                }
            }
            solution[i] = row
        }
        solution.map {
            $0.map {
                return $0 ? 1 : 0
            }
            }.debugPrint()

        if solution[array.count][sum] == false {
            return nil
        }
        
        var result = [Int]()
        var column = sum
        var row = array.count
        
        if solution[row][column] == false {
            return result
        }
        
        while column > 0 && row > 0 {
            while solution[row][column] == false {
                column -= 1
            }

            while solution[row - 1][column] == true {
                row -= 1
            }
            let value = array[row - 1]
            result.append(value)
            column -= value
            row -= 1
        }
        return result
    }
}
