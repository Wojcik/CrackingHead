//
//  MaxArraySum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/6/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/max-array-sum/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=dynamic-programming
 */

import Cocoa

class MaxArraySum: BaseProblem {
    func exec() {
        let array = "2 1 5 8 4".toIntArray()
        print(maxSubsetSum(arr: array))
    }
    func maxSubsetSum(arr: [Int]) -> Int {
        var auxArray = Array(repeating: 0, count: arr.count)
        if arr.count == 0 {
            return 0
        }
        if arr.count == 1 {
            return arr.first!
        }
        auxArray[0] = max(arr[0], 0)
        auxArray[1] = max(auxArray[0], arr[1])
        for i in 2..<arr.count {
            auxArray[i] = max(auxArray[i - 1], arr[i] + auxArray[i - 2])
        }
        return auxArray.last!
    }
}
