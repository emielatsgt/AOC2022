//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 02/12/2022.
//

import Foundation

func score(_ tuple: (Int, Int)) -> Int {
    let left = tuple.0
    let right = tuple.1
    
    return right + 1
    + (left == right ? 3 : 0)
    + (right == ((left + 1) % 3) ? 6 : 0)
}

func scoretwo(_ tuple: (Int, Int)) -> Int {
    let left = tuple.0
    let right = tuple.1
    
    let offset = (2 + left + right) % 3
    
    return score((left, offset))
}

var one = input.reduce(0) { $0 + score($1) }
var two = input.reduce(0) { $0 + scoretwo($1) }

// 11666
print(one)

// 12767
print(two)
