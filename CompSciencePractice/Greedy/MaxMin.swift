//
//  MaxMin.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/13/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/angry-children/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=greedy-algorithms
 */

import Cocoa

class MaxMin: BaseProblem {
    func exec() {
        let input = "4 1 2 3 4 10 20 30 40 100 200".toIntArray()
        print(maxMin(k: 3, arr: input))
    }
    
    func maxMin(k: Int, arr: [Int]) -> Int {
        let sorted = arr.sorted()
        print(sorted)
        var result = Int.max
        for i in 0...(sorted.count - k) {
            let subarray = sorted[i..<(i+k)]
            result = min(result, subarray.last! - subarray.first!)
        }
        return result
    }
}
