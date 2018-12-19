//
//  LetterCombinations.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/18/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class LetterCombinations: BaseProblem {
   
    private var results = [String]()
    private let letterArray: [Character: [Character]] = ["2":["a","b","c"],"3":["d","e","f"],"4":["g","h","i"],"5":["j","k","l"],"6":["m","n","o"],"7":["p","q","r","s"],"8":["t","u","v"],"9":["w","x","y","z"]]

    func exec() {
        let input = "23"
        print(letterCombinations(input))
    }
    
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return results }
        
        var currentSequeue = [Character]()
        dfs(inputDigits: Array(digits), currentIndex: 0, currentSequeue: &currentSequeue)
        return results
    }
    
    private func dfs(inputDigits: [Character], currentIndex: Int, currentSequeue: inout [Character]) {
        let currentLetters = letterArray[inputDigits[currentIndex]]!
        
        for letter in currentLetters {
            currentSequeue.append(letter)
            if currentIndex == inputDigits.count - 1 {
                results.append(String(currentSequeue))
            }else{
                dfs(inputDigits: inputDigits, currentIndex: currentIndex + 1, currentSequeue: &currentSequeue)
            }
            currentSequeue.removeLast()

        }
    }
    
    
    
}
