//
//  LargestRectangle.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/* Largest Rectangle
 https://www.hackerrank.com/challenges/largest-rectangle/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=stacks-queues
 */
import Foundation

class LargestRectangle: BaseProblem {
    func exec() {
        let array = [11, 11, 10, 10, 10]
        print(largestRectangle(h: array))
    }
    
    func largestRectangle(h: [Int]) -> Int {
        var area = Int.min
        var walls = [Int]()
        var index = 0
        while index < h.count {
            let height = h[index]
            if walls.isEmpty || height >= h[walls.last!] {
                walls.append(index)
                index += 1
            } else {
                area = max(area, calcArea(heights: h, walls: &walls, index: index))
            }
        }
        
        while walls.count > 0 {
            area = max(area, calcArea(heights: h, walls: &walls, index: index))
        }
        return area
    }
    
    private func calcArea(heights:[Int], walls:inout [Int], index:Int) -> Int {
        let leftmostWall = walls.popLast()!
        let area = heights[leftmostWall] * (walls.isEmpty ? index : (index - 1 - walls.last!))
        return area
    }
}
