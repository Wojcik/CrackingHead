//
//  NewYearChaos.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/24/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class NewYearChaos: BaseProblem {
    func exec() {
        let array = [1, 2, 5, 3, 7, 8, 6, 4]
//        let array = [5, 1, 2, 3, 7, 8, 6, 4]
        
        print(minimumBribes(q: array))
    }
    
    func minimumBribes(q: [Int]) -> Void {
        var index = q.count - 1
        var totalBribes = 0
        while index >= 0 {
            let shiftCount = q[index] - (index + 1)

            if (shiftCount > 2) {
                print("Too chaotic")
                return
            }
            for i in stride(from: max(0, q[index] - 2), to: index, by: 1) {
                if q[i] > q[index] {
                    totalBribes += 1
                }
            }
            index -= 1
        }
        print(totalBribes)
    }
}
