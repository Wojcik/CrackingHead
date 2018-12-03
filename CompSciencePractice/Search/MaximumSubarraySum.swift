//
//  MaximumSubarraySum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/30/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class MaximumSubarraySum: BaseProblem {
    
    func exec() {
        let array = "3 3 9 9 5".toIntArray()
        print(maximumSumBrute(a: array, m: 7))
        print(maximumSum(a: array, m: 7))
    }
    func maximumSumBrute(a: [Int], m: Int) -> Int {
        var result = Int.min
        //loop for sub array size
        for size in 1...a.count {
            //shifting array
            for start in 0...a.count - size {
                let slice = a[start..<(start+size)]
                let sum = slice.reduce(into: 0) { (result, value) in
                    result += value
                }
                if sum%m > result {
                    result = sum%m
                }
            }
        }
        return result
    }
    
    func maximumSum(a: [Int], m: Int) -> Int {
        var prefixSum = [Int]()
        var sum = 0
        for number in a {
            sum = (number%m + sum)%m
            prefixSum.append(sum)
        }
        print(prefixSum)
        return 0
    }
}
