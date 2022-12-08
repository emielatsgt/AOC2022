//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 08/12/2022.
//

import Foundation

func bruteForceVisibilities(_ array: [[Tree]]) {
    for y in 0 ..< array.count {
        for x in 0 ..< array[y].count {
            if x == 0 || y == 0 || x == array.count - 1 || y == array[y].count - 1 {
                array[y][x].visible = true
            } else {
                let tree = array[y][x]
                
                var visibleFromLeft = true
                var visibleFromRight = true
                var visibleFromTop = true
                var visibleFromBottom = true
                
                // Left
                for xx in 0 ..< x {
                    let otherTree = array[y][xx]
                    if otherTree.height >= tree.height { visibleFromLeft = false }
                }
                
                // Right
                for xx in x + 1 ..< array[y].count {
                    let otherTree = array[y][xx]
                    if otherTree.height >= tree.height { visibleFromRight = false }
                }
                
                // Top
                for yy in 0 ..< y {
                    let otherTree = array[yy][x]
                    if otherTree.height >= tree.height { visibleFromTop = false }
                }
                
                // Bottom
                for yy in y + 1 ..< array.count {
                    let otherTree = array[yy][x]
                    if otherTree.height >= tree.height { visibleFromBottom = false }
                }
                
                tree.visible = visibleFromTop || visibleFromLeft || visibleFromRight || visibleFromBottom
            }
        }
    }
}

func bruteForceVisibleAreas(_ array: [[Tree]]) {
    for y in 0 ..< array.count {
        for x in 0 ..< array[y].count {
            let tree = array[y][x]
            
            var visibilityLeft = 1
            var visibilityRight = 1
            var visibilityTop = 1
            var visibilityBottom = 1
            
            // Left
            for xx in stride(from: x - 1, to: 0, by: -1) {
                let otherTree = array[y][xx]
                if otherTree.height < tree.height { visibilityLeft += 1 }
                else { break }
            }
            
            // Right
            for xx in stride(from: x + 1, to: array[y].count - 1, by: 1) {
                let otherTree = array[y][xx]
                if otherTree.height < tree.height { visibilityRight += 1 }
                else { break }
            }
            
            // Top
            for yy in stride(from: y - 1, to: 0, by: -1) {
                let otherTree = array[yy][x]
                if otherTree.height < tree.height { visibilityTop += 1 }
                else { break }
            }
            
            // Bottom
            for yy in stride(from: y + 1, to: array.count - 1, by: 1) {
                let otherTree = array[yy][x]
                if otherTree.height < tree.height { visibilityBottom += 1 }
                else { break }
            }
            
            tree.visibleArea = visibilityLeft * visibilityRight * visibilityTop * visibilityBottom
        }
    }
}

func one() -> Int {
    let array = parse(lines)
    
    bruteForceVisibilities(array)
    
    return array
        .flatMap { $0 }
        .reduce(0) { $0 + ($1.visible ? 1 : 0) }
}

func two() -> Int {
    let array = parse(lines)
    
    bruteForceVisibleAreas(array)
    
    let candidate = array
        .flatMap { $0 }
        .max { $0.visibleArea < $1.visibleArea }
    
    return candidate?.visibleArea ?? 0
}

// 1789
print(one())

// 314820
print(two())

