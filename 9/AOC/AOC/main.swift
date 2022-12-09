//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 09/12/2022.
//

import Foundation
func visualize(head: Position, tail: [Position]) {
    var allPositions = tail
    allPositions.append(head)
    
    let minX = (allPositions.min { $0.x < $1.x }?.x) ?? 0
    let minY = (allPositions.min { $0.y < $1.y }?.y) ?? 0
    
    let maxX = (allPositions.max { $0.x < $1.x }?.x) ?? 0
    let maxY = (allPositions.max { $0.y < $1.y }?.y) ?? 0

    let dimX = 2 + maxX - minX
    let dimY = 2 + maxY - minY
    
    var grid: [[Character]] = .init(
        repeating: .init(repeating: ".",count: dimX),
        count: dimY
    )

    for (index, pos) in tail.enumerated() {
        grid[pos.y - minY][pos.x - minX] = "\(index + 1)".first ?? "x"
    }
    
    grid[head.y - minY][head.x - minX] = "H"
    
    let vstrings = grid.map { $0.reduce(into: "") { $0 += String($1) } }
    for string in vstrings.reversed() { print(string) }
    
    print("")
}

func solve(instructions: [Instruction], length: Int) -> Int {
    var visited: Set<Position> = []
    var headPosition = Position(x: 0, y: 0)
    var tailPositions: [Position] = .init(repeating: Position(x: 0, y: 0), count: length)
    
    for instruction in instructions {
        
        for _ in 0 ..< instruction.distance {
            headPosition = Position(
                x: headPosition.x + instruction.direction.deltaX,
                y: headPosition.y + instruction.direction.deltaY
            )
            
            tailPositions[0] = tailPositions[0].follow(headPosition)
            
            for index in 1 ..< tailPositions.count {
                tailPositions[index] = tailPositions[index].follow(tailPositions[index - 1])
            }
            
            visited.insert(tailPositions[tailPositions.count - 1])
        }
        
//        print(instruction)
//        visualize(head: headPosition, tail: tailPositions)
    }
    
    return visited.count
}

// 5695
print(solve(instructions: instructions, length: 1))

// 2434
print(solve(instructions: instructions, length: 9))
