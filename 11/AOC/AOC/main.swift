//
//  main.swift
//  AOC
//
//  Created by Emiel Lensink on 12/12/2022.
//

import Foundation

func one(with monkeys: [Monkey], gcd: Int) -> Int {
    var monkeys = monkeys
    
    for _ in 0 ..< 20 {
        for monkey in monkeys {
            let tuples = monkey.distributeItems(worryDivider: 3, gcd: gcd)
            for tuple in tuples {
                monkeys[tuple.1].items.append(tuple.0)
            }
        }
    }
    
    monkeys.sort { $0.inspected > $1.inspected }
    
    return monkeys[0].inspected * monkeys[1].inspected
}

func two(with monkeys: [Monkey], gcd: Int) -> Int {
    var monkeys = monkeys
    
    for _ in 0 ..< 10000 {
        for monkey in monkeys {
            let tuples = monkey.distributeItems(worryDivider: 1, gcd: gcd)
            for tuple in tuples {
                monkeys[tuple.1].items.append(tuple.0)
            }
        }
    }
    
    monkeys.sort { $0.inspected > $1.inspected }
    
    return monkeys[0].inspected * monkeys[1].inspected
}

let gcd = monkeys
    .map { $0.test }
    .reduce(1) { $0 * $1 }

// 113220
print(one(with: monkeys, gcd: gcd))

// 30606337192
print(two(with: monkeys, gcd: gcd))
