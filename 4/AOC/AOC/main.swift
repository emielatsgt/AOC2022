//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 04/12/2022.
//

import Foundation

func contains(_ left: ClosedRange<Int>, _ right: ClosedRange<Int>) -> Bool {
    right.clamped(to: left) == right
}

let one = ranges
    .reduce(0) { accu, item in
        accu + ((contains(item.0, item.1) || contains(item.1, item.0)) ? 1 : 0)
    }

let two = ranges
    .reduce(0) { accu, item in
        accu + (item.0.overlaps(item.1) ? 1 : 0)
    }

// 471
print(one)

// 888
print(two)
