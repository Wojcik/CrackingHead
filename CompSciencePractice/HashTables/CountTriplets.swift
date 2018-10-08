//
//  CountTriplets.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/30/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class CountTriplets: BaseProblem {
    func exec() {
        let array = [1, 3, 9, 9, 27, 81]
        print(countTriplets(arr: array, r:3))
    }
    
    func countTriplets(arr: [Int], r: Int) -> Int {
        var secondsCount = [Int:Int]()
        var thirdsCount = [Int:Int]()
        var totalCount = 0
        for number in arr {
            if let thirds = thirdsCount[number] {
                totalCount += thirds
            }
            
            if let seconds = secondsCount[number] {
                if let thirds = thirdsCount[number*r] {
                    thirdsCount[number*r] = thirds + seconds
                } else {
                    thirdsCount[number*r] = seconds
                }
            }
            
            if let seconds = secondsCount[number*r] {
                secondsCount[number*r] = seconds + 1
            } else {
                secondsCount[number*r] = 1
            }
        }
        return totalCount
    }
}


