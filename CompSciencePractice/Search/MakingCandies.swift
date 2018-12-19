//
//  MakingCandies.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/5/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/making-candies/problem
 */

import Cocoa

class MakingCandies: BaseProblem {
    
    func exec() {
        print(minimumPasses(m: 3, w: 1, p: 2, n: 12))
    }
    
    func minimumPasses(m: Int, w: Int, p: Int, n: Int) -> Int {
        var machines = m
        var workers = w
        var minimumDays = 1
        var maximumDays = n/(machines*workers)
        while true {
            let middle = (minimumDays + maximumDays)/2
            var newItemsForPeriod = ((machines*workers)*middle)/p
            if newItemsForPeriod > n {
                return middle
            }
            if ((machines*workers)*minimumDays)/p > n {
                maximumDays = middle
                while newItemsForPeriod > 0 {
                    while machines <= workers {
                        machines += 1
                        newItemsForPeriod -= 1
                    }
                    while workers <= machines {
                        workers += 1
                        newItemsForPeriod -= 1
                    }
                }
            } else {
                minimumDays = middle + 1
            }
        }
        return maximumDays
    }
}
