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
        let array = [-1, 2, 1, -4]
        print(threeSumClosest(array: array, target:1))
        
    }
    func threeSum(array:[Int], target:Int) -> [[Int]] {
        var results = [[Int]]()
        let input = array.sorted()
        for i in 0..<input.count {
            if i > 0 && input[i-1]==input[i]{
                continue
            }
            var j = i+1, k = input.count - 1
            while j < k {
                let sum = input[i] + input[j] + input[k]
                if sum > target {
                    k -= 1
                } else if sum < target {
                    j += 1
                } else {
                    results.append([input[i],input[j],input[k]])
                    while j < k && input[j] == input[j+1] {
                        j += 1
                    }
                    j += 1
                    while k > j && input[k] == input[k-1] {
                        k -= 1
                    }
                    k -= 1
                }
            }
        }
        return results
    }
    
    func threeSumClosest(array:[Int], target:Int) -> Int {
        guard array.count > 2 else {
            return -1
        }
        let input = array.sorted()
        var result = input[0] + input[1] + input[array.count - 1]
        for i in 0..<input.count - 2 {
            var j = i + 1
            var k = input.count - 1
            
            while j < k {
                let sum = input[i] + input[j] + input[k]
                if sum > target {
                    k -= 1
                } else if sum < target {
                    j += 1
                } else {
                    return sum
                }
                if abs(result - target) > abs(sum - target) {
                    result = sum
                }
            }
            
        }
        return result
    }
}
