//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 07/12/2022.
//

import Foundation

func traverse(_ directory: Directory) -> [Directory] {
    var temp: [Directory] = [directory]
    
    for sub in directory.subdirectories {
        temp.append(contentsOf: traverse(sub))
    }
    
    return temp
}

func one() -> Int {
    let root = parse(lines)
    let size = traverse(root)
        .filter { $0.size <= 100000 }
        .reduce(0) { $0 + $1.size }
    
    return size
}

func two() -> Int {
    let root = parse(lines)
    let unused = 70000000 - root.size
    let needed = 30000000
    let toDelete = needed - unused
    
    let smallest = traverse(root)
        .filter { $0.size >= toDelete }
        .min { $0.size < $1.size }
    
    return smallest?.size ?? 0
}

// 919137
print(one())

// 2877389
print(two())
