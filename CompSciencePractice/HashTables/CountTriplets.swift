//
//  CountTriplets.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/30/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class CountTriplets: BaseProblem {
    func exec() {
        let array = [1, 3, 9, 9, 27, 81]
        print(countTriplets(arr: array, r:3))
    }
    
    func countTriplets(arr: [Int], r: Int) -> Int {
        var tripletsSets = [Int:[[Int]]]()
        let array = arr.sorted()
        var count = 0
        
        for value in array {
            if tripletsSets[value] == nil {
                tripletsSets[value] = [[value]]
            } else {
                tripletsSets[value]!.append([value])
            }
            var previousSetId = value/r
            while previousSetId >= value / (r*r), tripletsSets[previousSetId] != nil {
                if let lastTriple = tripletsSets[previousSetId]!.last, lastTriple.last! == value {
                    tripletsSets[previousSetId]!.append(Array(lastTriple))
                } else {
                    for i in 0..<tripletsSets[previousSetId]!.count {
                        tripletsSets[previousSetId]![i].append(value)
                    }
                }
                previousSetId /= r
            }
        }
        
        for tripletsSets in tripletsSets.values {
            count += tripletsSets.reduce(into: 0) { result, value in
                result += value.count == 3 ? 1:0
            }
        }
        
        return count
    }
}

