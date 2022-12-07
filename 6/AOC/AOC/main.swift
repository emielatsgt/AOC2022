//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 07/12/2022.
//

import Foundation

func areAllDifferent(_ array: [Character]) -> Bool {
    Set(array).count == array.count
}

func find(unique: Int) -> Int {
    for offset in 0 ..< input.count - unique {
        let beginIndex = input.index(input.startIndex, offsetBy: offset)
        let endIndex = input.index(input.startIndex, offsetBy: offset + unique - 1)
        let slice = input[beginIndex ... endIndex]
        
        let characters = slice.map { Character(extendedGraphemeClusterLiteral: $0) }
        if areAllDifferent(characters) {
            return offset + unique
        }
    }
    
    return 0
}

// 1080
print(find(unique: 4))

// 3645
print(find(unique: 14))

