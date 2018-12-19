//
//  MaxProfitWithNonAdjanced.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/11/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class MaxProfitWithNonAdjanced: BaseProblem {
    func exec() {
        let input = [4, 5, 6, 3, 4]
        print(profit(input))
    }
    
    func profit(_ input:[Int]) -> Int {
        var pick = 0
        var notPick = 0
        pick = input[0]
        for i in 1..<input.count {
            let prevPick = pick
            pick = notPick + input[i]
            notPick = max(prevPick, notPick)

        }
        
        return max(pick, notPick)
    }
}
