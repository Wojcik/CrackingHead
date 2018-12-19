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
        print(minTime(machines: machines, goal: 5)) // 6
        machines = "1 3 4".toIntArray()
        print(minTime(machines: machines, goal: 10)) // 7
        machines = "4 5 6".toIntArray()
        print(minTime(machines: machines, goal: 12)) // 20
        machines = "63 2 26 59 16 55 99 21 98 65".toIntArray()
        print(minTime(machines: machines, goal: 56)) // 82
    }
    
    func minTimeDp(machines: [Int], goal: Int) -> Int {
        let minTime = machines.sorted().first!
        var result = Array(repeating: Array(repeating: 0, count: goal*minTime + 1), count: machines.count + 1)
        for i in 1..<result.count {
            var detailsPerDay = result[i]
            for j in 1..<detailsPerDay.count {
                detailsPerDay[j] = j/machines[i-1] + result[i-1][j]
                if detailsPerDay[j] == goal && i == result.count - 1{
                    return j
                }
            }
            result[i] = detailsPerDay
        }
        return -1
    }
    
    func minTime(machines: [Int], goal: Int) -> Int {
        let machines = machines.sorted()
        var minTime = machines.first! * goal / machines.count
        var maxTime = machines.first! * goal
        
        while minTime != maxTime {
            let mediumTime = (minTime + maxTime) / 2
            var production = 0
            for machineTime in machines {
                production += (mediumTime/machineTime)
            }
            if production >= goal {
                maxTime = mediumTime
            } else {
                minTime = mediumTime + 1
            }
        }
        return minTime
    }
}
