//
//  StringASCII.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/2/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

extension String {
    func toASCII() -> [Int] {
        return self.map { character in
            character.toASCII()
        }
    }
    
    static func lowercaseCharactersRange() -> ClosedRange<Int> {
        return Character("a").toASCII()...Character("z").toASCII()
    }
}
