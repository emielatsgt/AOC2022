//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 05/12/2022.
//

import Foundation

for string in nonmoves.reversed() {
    for offset in stride(from: 1, to: 34, by: 4) {
        let char = string.count >= offset ? string[offset] : " "
        
        let stackIndex = (offset - 1) / 4
        
        if char != " " {
            stacks[stackIndex].append(char)
        }
    }
}

func one(stacks: [[Character]], moves: [(Int, Int, Int)]) -> String {
    var stacks = stacks
    for move in moves {
        for _ in 0 ..< move.0 {
            stacks[move.2].append(stacks[move.1].removeLast())
        }
    }
    
    return stacks.reduce("") { accu, array in
        accu + String(array.last ?? Character(""))
    }
}

func two(stacks: [[Character]], moves: [(Int, Int, Int)]) -> String {
    var stacks = stacks
    for move in moves {
        let sub = stacks[move.1].suffix(move.0)
        stacks[move.2].append(contentsOf: sub)
        stacks[move.1].removeLast(move.0)
    }
    
    return stacks.reduce("") { accu, array in
        accu + String(array.last ?? Character(""))
    }
}

func time(passes: Int, _ closure: () -> Void) {
    let begin = Date()
    for _ in 0 ..< passes {
        closure()
    }
    let end = Date()
    print("\(passes) passes took \(end.timeIntervalSince(begin) * 1000)ms time.")
}



// TLNGFGMFN
print(one(stacks: stacks, moves: moves))

time(passes: 1000) { one(stacks: stacks, moves: moves) }

// FGLQJCMBD
print(two(stacks: stacks, moves: moves))



