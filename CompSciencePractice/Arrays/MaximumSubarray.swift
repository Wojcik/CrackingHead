//
//  MaximumSubarray.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/18/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class MaximumSubarray: BaseProblem {
    typealias result = (start:Int, end:Int, sum:Int)
    
    func exec() {
        let array = [13,-3,-25,20,-3,-16,-23,18,20,-7,12,-5,-22,15,-4,7]
        print(maximumSubarray(array, startIndex:0, endIndex:array.count-1))
        print(maximumSubarray(array))
    }
    
    func maximumSubarray(_ array:[Int]) -> result {
        var result = (start:0, end:0, sum:0)
        var subArraySum = 0

        for i in 0..<array.count {
            if subArraySum > 0 {
                subArraySum += array[i]
            } else {
                result.start = i
                subArraySum = array[i]
            }
            if subArraySum > result.sum {
                result.sum = subArraySum
                result.end = i
            }
        }
        return result
    }
    
    func maximumSubarray(_ array:[Int], startIndex:Int, endIndex:Int) -> result {
        if startIndex == endIndex {
            return (start:startIndex, end:endIndex, sum:array[startIndex])
        }
        let middle = (startIndex + endIndex)/2
        let leftSum = maximumSubarray(array, startIndex: startIndex, endIndex: middle)
        let rightSum = maximumSubarray(array, startIndex: middle + 1, endIndex: endIndex)
        let middleSum = maxCrossingSubarray(array, startIndex:startIndex, middle:middle, endIndex:endIndex)

        if leftSum.sum >= rightSum.sum && leftSum.sum >= middleSum.sum {
            return leftSum
        } else if rightSum.sum >= leftSum.sum && rightSum.sum >= middleSum.sum {
            return rightSum
        } else {
            return middleSum
        }
    }

    func maxCrossingSubarray(_ array:[Int], startIndex:Int, middle:Int, endIndex:Int) -> result {
        var result = (start:middle, end:middle, sum:0)

        var leftSum = 0
        var sum = 0
        for i in stride(from: middle, to: startIndex, by: -1) {
            sum += array[i]
            if sum > leftSum {
                result.start = i
                leftSum = sum
            }
        }
        var rightSum = 0
        sum = 0
        for j in stride(from: middle + 1, to: endIndex, by: 1) {
            sum += array[j]
            if sum > rightSum {
                result.end = j
                rightSum = sum
            }
        }
        result.sum = leftSum + rightSum
        return result
    }
}

