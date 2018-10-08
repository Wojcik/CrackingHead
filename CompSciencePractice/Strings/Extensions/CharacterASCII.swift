//
//  CharacterASCII.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/2/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

extension Character {
    func toASCII() -> Int {
        let scalar = unicodeScalars.first!.value
        assert(scalar >= ("a" as UnicodeScalar).value, "Character should be in range a...z")
        let value = unicodeScalars.first!.value - ("a" as UnicodeScalar).value
        return Int(value)
    }
}
