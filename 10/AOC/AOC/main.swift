//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 10/12/2022.
//

import Foundation

func one(instructions: [Instruction]) -> Int {
    var samples = [20, 60, 100, 140, 180, 220]
    
    var x = 1
    var cycle = 0
    var accu = 0
    
    for instruction in instructions {
        cycle += timing(for: instruction)

        if let sample = samples.first, cycle >= sample {
            let strength = sample * x
            accu += strength
            print("At cycle \(cycle), x = \(x), strength = \(strength), accu = \(accu)")
            samples.removeFirst()
        }
        
        switch instruction {
        case .noop: break
        case .addx(let value): x += value
        }
    }
    
    return accu
}

func two(instructions: [Instruction]) {
    var x = 1
    var cycle = 0
    var xpositions: [Int] = []
    
    for instruction in instructions {
        cycle += timing(for: instruction)

        while xpositions.count < cycle - 1 {
            xpositions.append(x)
        }
                
        switch instruction {
        case .noop: break
        case .addx(let value): x += value
        }
    }
    
    xpositions.append(xpositions.last ?? 0)
    
    for line in 0 ..< 6 {
        var string = ""
        
        for pos in 0 ..< 40 {
            let offset = pos + line * 40
            if abs(pos - (xpositions[offset] - 1)) <= 1 {
                string += "#"
            } else {
                string += "."
            }
        }
        
        print(string)
    }
}

// 14860
print(one(instructions: instructions))

// Not quite correct, but it's readable.
// ##...##..####.####.#..#.#..#.###..#..#..
// ..#.#..#....#.#....#..#.#..#.#..#.#.#...
// ..#.#......#..###..####.#..#.#..#.##....
// ##..#.##..#...#....#..#.#..#.###..#.#...
// .#..#..#.#....#....#..#.#..#.#.#..#.#...
// ..#..###.####.####.#..#..##..#..#.#..#..
two(instructions: instructions)
