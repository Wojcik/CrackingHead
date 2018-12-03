//
//  ThreeSum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/22/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class ThreeSum: BaseProblem {
    func exec() {
        let array = [-1, 0, 1, 2, -1, -4]
        print(threeSum(array: array, target:0))
        
    }
    func threeSum(array:[Int], target:Int) -> [[Int]] {
        let sorted = array.sorted()
        var result = [[Int]]()
        var left = array.startIndex
        while left < array.endIndex { defer {sorted.formUnigueIndex(after: &left)}
            var middle = sorted.index(after: left)
            var right = sorted.index(before: sorted.endIndex)
            while middle < right {
                let sum = sorted[left] + sorted[middle] + sorted[right]
                if sum == target {
                    result.append([sorted[left],sorted[middle],sorted[right]])
                    sorted.formUnigueIndex(after: &middle)
                    sorted.formUniqueIndex(before: &right)
                } else if sum < target {
                    sorted.formUnigueIndex(after: &middle)
                } else {
                    sorted.formUniqueIndex(before: &right)
                }
            }
        }
        return result
    }
}
