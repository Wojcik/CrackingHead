//
//  MInimumWindowSubstring.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/26/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class MInimumWindowSubstring: BaseProblem {
    func exec() {
        let string = "herea"
        let substring = "are"
        print(findMinimumWindow(string: string, substring: substring))

    }
    func findMinimumWindow(string :String, substring:String) -> Substring {
        var substringDict = substring.reduce(into: [:]) { (result: inout [Character:Int], character) in
            result[character, default:0] += 1
        }
        var counter = substring.count
        var begin = string.startIndex,
            end = string.startIndex,
            size = Int.max,
            head = string.startIndex,
            tail = string.startIndex
        while end < string.endIndex {
            var character = string[end]
            print(character)
            if let count = substringDict[character] {
                if count > 0 {
                    counter -= 1
                }
                let newCount = count - 1
                substringDict[character] = newCount
            }
            while counter == 0 {
                let distance = string.distance(from: begin, to: end)
                if size > distance {
                    head = begin
                    tail = end
                    size = distance
                }
                character = string[begin]
                if let count = substringDict[character] {
                    if (count == 0) {
                        counter += 1
                    }
                    let newCount = count + 1
                    substringDict[character] = newCount
                }
                begin = string.index(after: begin)
            }
            end = string.index(after: end)
        }
        
        return string[head...tail]
    }
}
