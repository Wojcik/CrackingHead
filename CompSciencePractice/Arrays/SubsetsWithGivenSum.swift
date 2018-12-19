//
//  SubsetsWithGivenSum.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/3/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class SubsetsWithGivenSum: BaseProblem {
    func exec() {
        let array = [2, 3, 5, 6, 8, 10]
        print(getAllSubsetsFrom(array: array, withGivenSum: 10))
    }
    
    func getAllSubsetsFrom(array:[Int], withGivenSum sum:Int) -> [[Int]] {
        let array = array.sorted()
        var results = [[Int]]()
        var start = 0
        while start < array.count {
            var currSum = array[start]
        }

        return results
    }
}
