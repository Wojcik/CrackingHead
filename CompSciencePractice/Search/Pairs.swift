//
//  Pairs.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/29/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/pairs/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=search
 */

import Cocoa

class Pairs: BaseProblem {
    func exec() {
        let pairsArr = "1 5 3 4 2".split(separator: " ").map{Int($0)!}
        print(pairs(k: 2, arr: pairsArr))
    }
    
    func pairs(k: Int, arr: [Int]) -> Int {
        var count = 0
        var dict = [Int:Int]()
        for number in arr {
            if dict[number - k] != nil {
                count += 1
            }
            if dict[number + k] != nil {
                count += 1
            }
            dict[number] = number
        }
        return count
    }
}
