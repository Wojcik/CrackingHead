//
//  Candies.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/candies
 */

import Cocoa

class Candies: BaseProblem {
    func exec() {
        let childs = """
        2
        4
        2
        6
        1
        7
        8
        9
        2
        1
        """.split(separator: "\n").map {Int($0)!}
        print(candies(n: childs.count, arr: childs))
    }
    
    func candies(n: Int, arr: [Int]) -> Int {
//        print(arr)
        var candiesGiven = Array(repeating: 1, count: n)
        for i in 1..<arr.count {
            candiesGiven[i] = 1
            if arr[i] > arr[i-1] {
                candiesGiven[i] =  candiesGiven[i - 1] + 1
            }
        }
//        print(candiesGiven)
        for i in stride(from: arr.count - 1, to: 0, by: -1) {
            if arr[i] < arr[i-1] {
                candiesGiven[i - 1] =  max(candiesGiven[i - 1], candiesGiven[i] + 1)
            }
        }
//        print(candiesGiven)
        return candiesGiven.reduce(0, { (result, value) -> Int in
            return result + value
        })
    }
}
