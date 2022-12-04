//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 04/12/2022.
//

import Foundation

func contains(_ left: ClosedRange<Int>, _ right: ClosedRange<Int>) -> Bool {
    return right.lowerBound >= left.lowerBound && right.upperBound <= left.upperBound
}

func overlaps(_ left: ClosedRange<Int>, _ right: ClosedRange<Int>) -> Bool {
    return (right.lowerBound >= left.lowerBound && right.upperBound <= left.upperBound) || (right.upperBound >= left.lowerBound && right.lowerBound <= left.upperBound)
}

let one = ranges
    .reduce(0) { accu, item in
        accu + ((contains(item.0, item.1) || contains(item.1, item.0)) ? 1 : 0)
    }

let two = ranges
    .reduce(0) { accu, item in
        accu + (overlaps(item.0, item.1) ? 1 : 0)
    }

// 471
print(one)

// 888
print(two)



