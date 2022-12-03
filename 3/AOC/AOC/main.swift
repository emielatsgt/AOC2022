//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 03/12/2022.
//

import Foundation

let one = data
    .map { $0.0.intersection($0.1) }
    .compactMap { $0.first }
    .reduce(0) { $0 + $1 }

print(one)

let two = datatwo
    .map { $0[0].intersection($0[1]).intersection($0[2]) }
    .compactMap { $0.first }
    .reduce(0) { $0 + $1 }

print(two)
