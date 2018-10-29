//
//  MiximumToys.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/23/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//
/*
 Problem description - https://www.hackerrank.com/challenges/mark-and-toys/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=sorting
*/
import Foundation

class MaximumToys : BaseProblem {
    func exec() {
        let toysPrices = [1, 12, 5, 111, 200, 1000, 10]
        print(maximumToysBrute(prices: toysPrices, k: 50))
        print(maximumToysBruteSort(prices: toysPrices, k: 50))
    }
    
    //Bruteforce
    func maximumToysBrute(prices: [Int], k: Int) -> Int {
        var maxToys = Int.min
        for i in 0..<prices.count {
            var currPrice = prices[i]
            if currPrice >= k {
                continue
            }
            var currToysCount = 1
            for j in i+1..<prices.count {
                if (currPrice + prices[j] <= k) {
                    currPrice += prices[j]
                    currToysCount += 1
                }
            }
            maxToys = max(maxToys, currToysCount)
        }
        return maxToys
    }
    
    func maximumToysBruteSort(prices: [Int], k: Int) -> Int {
        var maxToys = 0
        let a = prices.sorted()
        var moneyCnt = k
        for price in a {
            moneyCnt -= price
            if (moneyCnt >= 0) {
                maxToys += 1
            }
        }
        return maxToys
    }
    
}
