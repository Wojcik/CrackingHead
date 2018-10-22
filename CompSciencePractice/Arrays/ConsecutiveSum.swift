//
//  ConsecutiveSum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/9/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class ConsecutiveSum: BaseProblem {
    func exec() {
        let array = [100, 200, 100, 400, 500, 2, 897]
        print(maxSumOfK(in: array, k: 2))
    }
    
    func maxSumOfK(in array:[Int], k:Int) -> Int {
        var currentSum = 0
        var maxSum = Int.min
        for i in 0..<k {
            currentSum += array[i]
        }
        
        for i in k..<array.count {
            currentSum = currentSum + array[i] - array[i-k]
            maxSum = max(maxSum, currentSum)
        }
        return maxSum
    }
}
