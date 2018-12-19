//
//  MinAbsoluteDifference.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/11/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/minimum-absolute-difference-in-an-array/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=greedy-algorithms
 */

import Cocoa

class MinAbsoluteDifference: BaseProblem {
    func exec() {
        var inputString = try! readFileFromExecDirectory("input.txt")
        inputString = "-59 -36 -13 1 -53 -92 -2 -96 -54 75"
        let input = inputString.toIntArray()
        print(minimumAbsoluteDifference(arr: input))
        print(minimumAbsoluteDifferenceSort(arr: input))
        print(minimumAbsoluteDifferenceBrute(arr: input))
    }
    
    func minimumAbsoluteDifferenceSort(arr: [Int]) -> Int {
        var arr = arr.sorted()
        var minDiff = Int.max
        for i in 1..<arr.count {
            minDiff = min(minDiff, abs(arr[i-1] - arr[i]))
        }
        return minDiff
    }
    func minimumAbsoluteDifference(arr: [Int]) -> Int {
        return minimumAbsoluteDifference(arr: arr, minDerived: Int.max)
    }
    
    func minimumAbsoluteDifference(arr: [Int], minDerived:Int) -> Int {
        if arr.isEmpty {
            return Int.max
        }
        var minSet = Set<Int>()
        var maxSet = Set<Int>()
        var minDerived = minDerived
        for i in 1..<arr.count {
            minDerived = min(minDerived, abs(arr[i-1] - arr[i]))
            minSet.insert(min(arr[i-1], arr[i]))
            maxSet.insert(max(arr[i-1], arr[i]))
        }
        minDerived = min(minimumAbsoluteDifference(arr: Array(minSet), minDerived: minDerived),
                         minimumAbsoluteDifference(arr: Array(maxSet), minDerived: minDerived),
                         minDerived)
        return minDerived
    }
    
    func minimumAbsoluteDifferenceBrute(arr: [Int]) -> Int {
        return minimumAbsoluteDifference(arr: arr, start: 0, minDerived: Int.max)
    }
    
    func minimumAbsoluteDifference(arr: [Int], start:Int, minDerived:Int) -> Int {
        if start == arr.count {
            return 0
        }
        var minDerived = minDerived
        let value = arr[start]
        for i in (start + 1)..<arr.count {
            minDerived = min(minDerived, abs(value - arr[i]), minimumAbsoluteDifference(arr: arr, start: i, minDerived: minDerived))
        }
        return minDerived
    }
}
