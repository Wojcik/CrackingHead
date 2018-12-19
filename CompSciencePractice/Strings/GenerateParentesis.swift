//
//  GenerateParentesis.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/19/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class GenerateParentesis: BaseProblem {
    
    private var result = [String]()
    
    func exec() {
        print(generateParenthesis(3))
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        makeParentesis(&result, "", n, 0)
        return result
    }
    
    func makeParentesis(_ result: inout [String], _ string:String, _ openingCount:Int, _ closingCount:Int) {
        if openingCount == 0 && closingCount == 0 {
            result.append(string)
            return
        }
        
        if openingCount > 0 {
            makeParentesis(&result, string + "(", openingCount - 1, closingCount + 1)
        }
        if closingCount > 0 {
            makeParentesis(&result, string + ")", openingCount, closingCount - 1)
        }
    }

}
