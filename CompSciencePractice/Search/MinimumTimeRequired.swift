//
//  MinimumTimeRequired.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/30/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/minimum-time-required/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=search
 */

import Cocoa

class MinimumTimeRequired: BaseProblem {
    
    func exec() {
        var machines = "2 3".toIntArray()
        print(minTime(machines: machines, goal: 5))
        machines = "1 3 4".toIntArray()
        print(minTime(machines: machines, goal: 10))
        machines = "4 5 6".toIntArray()
        print(minTime(machines: machines, goal: 12))
    }
    
    func minTime(machines: [Int], goal: Int) -> Int {
        var detailsPerDay = 0.0
        for machine in machines {
            detailsPerDay += 1.0/Double(machine)
        }
        var result = Double(goal)/detailsPerDay
        print(result)
        print(result.rounded(.awayFromZero))
        print(result.rounded(.toNearestOrEven))
        print(result.rounded(.towardZero))
        return Int(result.rounded(.awayFromZero))
    }
}
