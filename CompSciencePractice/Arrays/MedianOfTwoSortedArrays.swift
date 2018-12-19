//
//  MedianOfTwoSortedArrays.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/17/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class MedianOfTwoSortedArrays: BaseProblem {
    func exec() {
        let first = "1 3".toIntArray()
        let second = "2".toIntArray()
        print(findMedian(first, second))
    }
    
    func findMedian(_ first:[Int], _ second:[Int]) -> Double {
        if first.count > second.count {
            return findMedian(second, first)
        }
        var start = 0
        var end = first.count
        let isEven = (first.count + second.count) % 2 == 0
        while start < end {
            let partitionFirst = (start + end)/2
            let partitionSecond = (first.count + second.count + (isEven ? 1 : 0))/2 - partitionFirst
            
            let maxLeftOfFirst = partitionFirst == 0 ? Int.min : first[partitionFirst - 1]
            let minRightOfFirst = partitionFirst == first.count ? Int.max : first[partitionFirst]
            
            let maxLeftOfSecond = partitionSecond == 0 ? Int.min : second[partitionSecond - 1]
            let minRightOfSecond = partitionSecond == second.count ? Int.max : second[partitionSecond]

             if (maxLeftOfFirst > minRightOfSecond) {
                end = partitionFirst - 1
            } else if maxLeftOfSecond > minRightOfFirst {
                start = partitionFirst + 1
            } else {
                if isEven{
                    return Double(max(maxLeftOfFirst, maxLeftOfSecond) + min(minRightOfFirst, minRightOfSecond))/2.0
                } else {
                    return Double(max(maxLeftOfFirst, maxLeftOfSecond))
                }
            }
        }

        return -1
    }
}
