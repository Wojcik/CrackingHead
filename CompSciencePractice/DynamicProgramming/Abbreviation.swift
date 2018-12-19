//
//  Abbreviation.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/6/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

/*
 Problem description - https://www.hackerrank.com/challenges/abbr/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=dynamic-programming&h_r=next-challenge&h_v=zen
 */
import Cocoa

class Abbreviation: BaseProblem {

    func exec() {
        let input = """
        daBcd
        ABC
        """.split(separator: "\n").map {String($0)}
//        let input = """
//        AGGTAB
//        GXTXAYB
//        """.split(separator: "\n").map {String($0)}
        var strings = [[String]]()
        var pairs:[String]?
        for string in input {
            if pairs == nil {
                pairs = [string]
            } else {
                pairs!.append(string)
                strings.append(pairs!)
                pairs = nil
            }
        }
        for pair in strings {
            print(abbreviation(a: pair[0], b: pair[1]))
        }
    }
    
    func abbreviation(a: String, b: String) -> String {
        let toModify = Array(a)
        let toMatch = Array(b)
        
        return abbreviation(a: toModify, b: toMatch) ? "YES" : "NO"
    }
    
    func abbreviation(a: [Character], b: [Character]) -> Bool {
        let lowerCaseSet = CharacterSet.lowercaseLetters

        var memo = Array(repeating: Array(repeating: false, count: b.count + 1), count: a.count + 1)
        memo[0][0] = true
        for i in 1..<memo.count {
            let char = a[i-1]
            if lowerCaseSet.contains(char.unicodeScalars.first!) {
                memo[i][0] = memo[i-1][0]
            }
        }
        for i in 1..<memo.count {
            for j in 1..<memo[i].count {
                let charA = a[i - 1]
                let charB = b[j - 1]
                if !lowerCaseSet.contains(charA.unicodeScalars.last!) {
                    if (charA == charB) {
                        memo[i][j] = memo[i-1][j-1]
                    }
                } else {
                    if String(a[i-1]).uppercased() == String(b[j-1]) {
                        memo[i][j] = memo[i-1][j-1] || memo[i-1][j]
                    } else {
                        memo[i][j] = memo[i-1][j]
                    }
                }
            }
        }
        return memo.last!.last!
    }
}

/*
 NO
 YES
 YES
 YES
 NO
 YES
 YES
 YES
 YES
 YES
 */
