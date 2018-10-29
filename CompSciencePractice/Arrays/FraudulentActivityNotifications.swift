//
//  FraudulentActivityNotifications.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/24/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class FraudulentActivityNotifications: BaseProblem {
    func exec() {
        let expenditures = [1, 2, 3, 4, 4]
        print(activityNotifications(expenditure: expenditures, d: 4))
        
    }
    
    func activityNotifications(expenditure: [Int], d: Int) -> Int {
        var notifCount = 0
        var counts = [Int:Int]()
        
        for i in 0..<d {
            counts[expenditure[i], default:0] += 1
        }
        
        for i in d..<expenditure.count {
            var median = 0

            var sum = 0
            for key in counts.keys.sorted() {
                sum += counts[key]!
                if sum >= d/2 + 1 {
                    if median != 0 {
                        median = (median + key)/2
                    }
                    median = key
                    if d%2 != 0 && median != 0{
                        break
                    }
                }
            }
            
            if expenditure[i] >= median*2 {
                notifCount += 1
            }
            counts[expenditure[i-d]] = counts[expenditure[i-d]]! - 1
            if counts[expenditure[i-d]] == 0 {
                counts[expenditure[i-d]] = nil
            }
            counts[expenditure[i]] = (counts[expenditure[i]] ?? 0) + 1
        }
        
        
        return notifCount
    }
}
