//
//  CountInversions.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/29/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class CountInversions: BaseProblem {
    func exec() {
        let array = [2, 4, 1, 3, 5]
        print(bruteCount(array))
        print(countInversions(array))
    }
    
    func bruteCount(_ array:[Int]) -> Int {
        var count = 0
        for i in 0..<array.count - 1 {
            for j in i..<array.count {
                if array[i] > array[j] {
                    count += 1
                }
            }
        }
        return count
    }
    
    func countInversions(_ array:[Int]) -> Int {
        guard array.count > 1 else {
            return 0
        }
        var array = array
        return countInversions(&array, start:0, end:array.count - 1)
    }
    
    func countInversions(_ array:inout [Int], start:Int, end:Int) -> Int {
        if start >= end {
            return 0
        }
        let middle = (start + end)/2
        var count = countInversions(&array, start: start, end: middle)
        count += countInversions(&array, start: middle + 1, end: end)
        count += mergeCount(&array, start: start, middle: middle, end: end)
        return count
    }
    
    func mergeCount(_ array:inout [Int], start:Int, middle:Int, end:Int) -> Int {
        var count = 0
        let leftPart = Array(array[start...middle])
        let rightPart = Array(array[(middle + 1)...end])
        var i = 0
        var j = 0
        for k in start...end {
            if i > leftPart.count - 1 {
                array[k...end] = rightPart[j...]
            } else if j > rightPart.count - 1 {
                array[k...end] = leftPart[i...]
            } else if leftPart[i] <= rightPart[j] {
                array[k] = leftPart[i]
                i += 1
            } else {
                array[k] = rightPart[j]
                j += 1
                count += leftPart.count - i
            }
        }
        return count
    }
}
