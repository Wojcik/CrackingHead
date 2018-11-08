//
//  Crossword.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/7/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Crossword: BaseProblem {
    func exec() {
        let input = """
        +-++++++++
        +-++++++++
        +-++++++++
        +-----++++
        +-+++-++++
        +-+++-++++
        +++++-++++
        ++------++
        +++++-++++
        +++++-++++
        """.split(separator: "\n").map {String($0)}
        print(crosswordPuzzle(crossword: input, words: "LONDON;DELHI;ICELAND;ANKARA"))
    }
    func crosswordPuzzle(crossword: [String], words: String) -> [String] {
        var words = words.split(separator: ";").map {String($0)}
        var crossword = crossword.reduce(into: [[Int]]()) { (result: inout [[Int]], value) in
            result.append(value.map {
                return $0 == "+" ? 0 : 1
            })
        }
        crossword.insert(Array(repeating: 0, count: crossword.first!.count), at: 0)
        crossword.append(Array(repeating: 0, count: crossword.first!.count))
        crossword = crossword.map {
            var newArray = $0
            newArray.insert(0, at: 0)
            newArray.append(0)
            return newArray
        }
        crosswordPuzzle(crossword: &crossword, words: words)

        return [""]
    }
    func crosswordPuzzle(crossword: inout [[Int]], words: [String]) -> [String] {
        for i in 0..<crossword.count {
            for j in 0..<crossword[i].count {
                if crossword[i][j] == -1 {
                    continue
                } else if (crossword[i][j] == 1) {
                    var countHorizontal = 0
                    var jH = j
                    while crossword[i][jH] == 1 {
                        if !isIntersection(i,jH, crossword, directions:[[-1, 0], [1, 0]]) {
                            crossword[i][jH] = 2
                        }
                        countHorizontal += 1
                        jH += 1
                    }
                    
                    var countVertical = 0
                    var iV = i
                    while crossword[iV][j] == 1 {
                        if !isIntersection(iV,j, crossword, directions: [[0, 1], [0, -1]]) {
                            crossword[iV][j] = 2
                        }
                        countVertical += 1
                        iV += 1
                    }
                    print(countHorizontal, countVertical)
                }
            }
        }
        return [""]
    }
    
    func isIntersection(_ i:Int, _ j:Int, _ array:[[Int]], directions:[[Int]]) -> Bool {
        var result = false
        for direction in directions {
            let i = i + direction[0]
            let j = j + direction[1]
            result = result || (array[i][j] == 1)
        }
        return result
    }
}
