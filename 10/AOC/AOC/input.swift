//
//  input.swift
//  AOC
//
//  Created by Emiel Lensink on 10/12/2022.
//

import Foundation

//let input = """
//addx 15
//addx -11
//addx 6
//addx -3
//addx 5
//addx -1
//addx -8
//addx 13
//addx 4
//noop
//addx -1
//addx 5
//addx -1
//addx 5
//addx -1
//addx 5
//addx -1
//addx 5
//addx -1
//addx -35
//addx 1
//addx 24
//addx -19
//addx 1
//addx 16
//addx -11
//noop
//noop
//addx 21
//addx -15
//noop
//noop
//addx -3
//addx 9
//addx 1
//addx -3
//addx 8
//addx 1
//addx 5
//noop
//noop
//noop
//noop
//noop
//addx -36
//noop
//addx 1
//addx 7
//noop
//noop
//noop
//addx 2
//addx 6
//noop
//noop
//noop
//noop
//noop
//addx 1
//noop
//noop
//addx 7
//addx 1
//noop
//addx -13
//addx 13
//addx 7
//noop
//addx 1
//addx -33
//noop
//noop
//noop
//addx 2
//noop
//noop
//noop
//addx 8
//noop
//addx -1
//addx 2
//addx 1
//noop
//addx 17
//addx -9
//addx 1
//addx 1
//addx -3
//addx 11
//noop
//noop
//addx 1
//noop
//addx 1
//noop
//noop
//addx -13
//addx -19
//addx 1
//addx 3
//addx 26
//addx -30
//addx 12
//addx -1
//addx 3
//addx 1
//noop
//noop
//noop
//addx -9
//addx 18
//addx 1
//addx 2
//noop
//noop
//addx 9
//noop
//noop
//noop
//addx -1
//addx 2
//addx -37
//addx 1
//addx 3
//noop
//addx 15
//addx -21
//addx 22
//addx -6
//addx 1
//noop
//addx 2
//addx 1
//noop
//addx -10
//noop
//noop
//addx 20
//addx 1
//addx 2
//addx 2
//addx -6
//addx -11
//noop
//noop
//noop
//"""

let input = """
noop
addx 7
addx -1
addx -1
addx 5
noop
noop
addx 1
addx 3
addx 2
noop
addx 2
addx 5
addx 2
addx 10
addx -9
addx 4
noop
noop
noop
addx 3
addx 5
addx -40
addx 26
addx -23
addx 2
addx 5
addx 26
addx -35
addx 12
addx 2
addx 17
addx -10
addx 3
noop
addx 2
addx 3
noop
addx 2
addx 3
noop
addx 2
addx 2
addx -39
noop
addx 15
addx -12
addx 2
addx 10
noop
addx -1
addx -2
noop
addx 5
noop
addx 5
noop
noop
addx 1
addx 4
addx -25
addx 26
addx 2
addx 5
addx 2
noop
addx -3
addx -32
addx 1
addx 4
addx -2
addx 3
noop
noop
addx 3
noop
addx 6
addx -17
addx 27
addx -7
addx 5
addx 2
addx 3
addx -2
addx 4
noop
noop
addx 5
addx 2
addx -39
noop
noop
addx 2
addx 5
addx 3
addx -2
addx 2
addx 11
addx -4
addx -5
noop
addx 10
addx -18
addx 19
addx 2
addx 5
addx 2
addx 2
addx 3
addx -2
addx 2
addx -37
noop
addx 5
addx 4
addx -1
noop
addx 4
noop
noop
addx 1
addx 4
noop
addx 1
addx 2
noop
addx 3
addx 5
noop
addx -3
addx 5
addx 5
addx 2
addx 3
noop
addx -32
noop
"""


enum Instruction {
    case addx(Int)
    case noop
}

func timing(for instruction: Instruction) -> Int {
    switch instruction {
    case .noop: return 1
    case .addx: return 2
    }
}

let instructions = input
    .components(separatedBy: .newlines)
    .map { line in
        let parts = line.components(separatedBy: " ")
        switch parts[0] {
        case "noop": return Instruction.noop
        case "addx": return Instruction.addx(Int(parts[1]) ?? 0)
        default:
            fatalError()
        }
    }

