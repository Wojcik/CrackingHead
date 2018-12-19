//
//  ContainerWithMostWater.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/18/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class ContainerWithMostWater: BaseProblem {
    func exec() {
        let input = [2,3,4,5,18,17,6]
        print(maxArea(input))
    }
    
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var volume = 0
        while left < right {
            volume = max(volume, min(height[left], height[right])*(right - left))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return volume
    }
}
