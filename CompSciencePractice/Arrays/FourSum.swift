//
//  FourSum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/18/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class FourSum: BaseProblem {
    
    func exec() {
        let input = [0,0,0,0]
        print(fourSum(input, 0))
    }
    
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        let nums = nums.sorted()
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i - 1] {
                continue
            }
            for j in (i + 1)..<nums.count {
                if j > i + 1 && nums[j] == nums[j - 1] {
                    continue
                }
                var k = j + 1
                var l = nums.count - 1
                while k < l {
                    let sum = nums[i] + nums[j] + nums[k] + nums[l]
                    if sum > target {
                        l -= 1
                    } else if sum < target {
                        k += 1
                    } else {
                        result.append([nums[i], nums[j], nums[k], nums[l]])
                        
                        while k < l && nums[k + 1] == nums[k] {
                            k += 1
                        }
                        k += 1
                        while k < l && nums[l] == nums[l - 1] {
                            l -= 1
                        }
                        l -= 1
                    }
                }
            }
        }
        return result
    }
}
