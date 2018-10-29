//
//  CountSort.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/24/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class CountSort: BaseProblem {
    func exec() {
        let array = [1, 4, 1, 2, 7, 5, 2]
        print(countSort(array))
    }
    
    func countSort(_ array:[Int]) -> [Int] {
        var result = Array(repeating: 0, count: array.count)
        var counts = Array(repeating: 0, count: 200)
        
        for value in array {
            counts[value] += 1
        }
        
        for i in 1..<counts.count {
            counts[i] += counts[i-1]
        }
        for value in array {
            let index = counts[value] - 1
            counts[value] -= 1
            result[index] = value
        }
        return result
    }
}
