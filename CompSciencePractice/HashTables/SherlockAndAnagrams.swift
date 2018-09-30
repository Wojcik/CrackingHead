//
//  SherlockAndAnagrams.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 9/26/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class SherlockAndAnagrams: BaseProblem {
    func exec() {
        let string = "bbcbacaabacacaaacbbcaabccacbaaaabbcaaaaaaaccaccabcacabbbbabbbbacaaccbabbccccaacccccabcabaacaabbcbaca"
        print(sherlockAndAnagrams(s: string))
        
    }

    
    func sherlockAndAnagrams(s: String) -> Int {
        var stringSize = 1
        let longestString = s.count - 1
        var length = 1
        var dict: [String: Int] = [:]
        
        while length <= longestString  {
            
            //create all substrings of the given length
            for i in 0...longestString {
                let part = String(s.dropFirst(i).prefix(length)).sorted().map({String($0)}).joined()
                
                if part.count == length {
                    let countVal = dict[part] ?? 0
                    dict[part] = countVal + 1
                }
            }
            length += 1
        }
        
        var anagramsCount = 0
        
        for (_, count) in dict {
            anagramsCount += Utils.combinationsCount(n: count, k:2) // k taken from n
        }
        return anagramsCount
    }
}
