//
//  LuckBalance.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/11/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/luck-balance/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=greedy-algorithms
 */

import Cocoa

class LuckBalance: BaseProblem {
    func exec() {
        print(luckBalance(k: 3, contests: [[5,1],[2,1],[1,1],[8,1],[10,0],[5,0]]))
    }
    
    func luckBalance(k: Int, contests: [[Int]]) -> Int {
        var balance = 0
        var canBeLoosed = k
        var importantTests = [Int]()
        for contest in contests {
            if contest[1] == 0 {
                balance += contest[0]
            } else {
                importantTests.append(contest[0])
            }
        }
        importantTests = importantTests.sorted()
        for i in stride(from: importantTests.count - 1, to: -1, by: -1) {
            if canBeLoosed > 0 {
                balance += importantTests[i]
                canBeLoosed -= 1
            } else {
                balance -= importantTests[i]
            }
        }
        return balance
    }
}
