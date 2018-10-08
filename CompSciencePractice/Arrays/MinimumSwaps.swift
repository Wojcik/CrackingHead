//
//  MinimumSwaps.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/25/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class MinimumSwaps: BaseProblem {
    func exec() {
        let array = [1, 3, 5, 2, 4, 6, 8]
        let result = countSwaps(array: array)
        //        let resultBrute = countSwapsNN(array: array)
        
        print(array, result)
    }
    
    func countSwaps(array:[Int]) -> Int {
        var count = 0
        var dict = [Int:Int]()
        for i in 0..<array.count {
            dict[array[i]] = i
        }
        var checkedPositions = [Bool](repeating: false, count: array.count)
        let listSorted = dict.keys.sorted(by: <)
        for i in 0..<array.count {
            let number = listSorted[i]
            if array[i] == number || checkedPositions[dict[number]!] == true{
                continue
            }
            var position = dict[number]!
            var cycleLenght = 0
            while checkedPositions[position] == false {
                let numberAtRequiredPos = listSorted[position]
                checkedPositions[position] = true
                position = dict[numberAtRequiredPos]!
                cycleLenght += 1
            }
            count += cycleLenght - 1
        }
        return count
    }
}

