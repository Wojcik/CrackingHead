//
//  Crossword.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/7/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

enum Direction:Int {
    case horizontal
    case vertical
}

struct CandidatePosition {
    let i:Int
    let j:Int
    let direction:Direction
    let chars:[Character]
}

class Crossword: BaseProblem {
    let directionsI = [0, 1]
    let directionsJ = [1, 0]
    
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
        let field = crossword.map {Array($0)}
//        if fillCrossword(field: field, words: words.split(separator: ";").map {String($0)}) {
//            return [""]
//        } else {
//            return [""]
//        }
        var positions = getCandidatesPositions(field)
        return [""]
    }
    
    func getCandidatesPositions(_ field:[[Character]]) -> [CandidatePosition] {
        var result = [CandidatePosition]()
        for i in 0..<field.count {
            for j in 0..<field[i].count {
                if field[i][j] == "-" && field[i][j+1] == "-"{
                    var next = j + 1
                    var wordLenght = 1
                    while next < field.count && field[next][j] == "-" {
                        wordLenght += 1
                        next += 1
                    }
                    let candidatePos = CandidatePosition(i: i, j: j, direction: .horizontal, chars: [Character]())
                    result.append(candidatePos)
                    break
                }
            }
        }
        return result
    }
    
    func fillCrossword(field:[[Character]], words:[String]) -> Bool {
        printField(field)
        if words.count == 0 {
            return true
        }
        for i in 0..<field.count {
            for j in 0..<field[i].count {
                if field[i][j] == "-" {
                    var nextI = i + 1
                    var wordLenght = 1
                    while nextI < field.count && field[nextI][j] == "-" {
                        wordLenght += 1
                        nextI += 1
                    }
                    if wordLenght == 1 {
                        return false
                    }
                    let candidates = words.filter {$0.count == wordLenght}
                    if candidates.isEmpty {
                        return false
                    }
                    for candidate in candidates {
                        var candidateChars = Array(candidate)
                        var field = field
                        var remainingChars = wordLenght
                        while remainingChars > 0 {
                            let idx = candidateChars.count - remainingChars
                            field[i + idx][j] = candidateChars[idx]
                            remainingChars -= 1
                        }
                        let remainingWords = words.filter {$0 != candidate}
                        fillCrossword(field: field, words: remainingWords)
                    }
                }
            }
        }
        return false
    }
    
    func printField(_ field:[[Character]]) {
        for row in field {
            print(row)
        }
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
