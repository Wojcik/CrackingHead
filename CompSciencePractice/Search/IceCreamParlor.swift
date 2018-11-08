//
//  IceCreamParlor.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/5/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa
/*
 Problem description - https://www.hackerrank.com/challenges/ctci-ice-cream-parlor/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=search
 */
class IceCreamParlor: BaseProblem {
    func exec() {
        whatFlavors(cost: "1 4 5 3 2".split(separator: " ").map {Int($0)!}, money: 4)
    }
    func whatFlavors(cost: [Int], money: Int) -> Void {
        var pairs = [Int:Int]()
        for i in 0..<cost.count {
            let price = cost[i]
            let matchedPrice = money - price
            if let pair = pairs[matchedPrice] {
                print(pair + 1, i + 1)
                return
            }
            pairs[price] = i
        }
    }
}
