//
//  input.swift
//  AOC
//
//  Created by Emiel Lensink on 12/12/2022.
//

import Foundation

let input = """
Monkey 0:
  Starting items: 98, 89, 52
  Operation: new = old * 2
  Test: divisible by 5
    If true: throw to monkey 6
    If false: throw to monkey 1

Monkey 1:
  Starting items: 57, 95, 80, 92, 57, 78
  Operation: new = old * 13
  Test: divisible by 2
    If true: throw to monkey 2
    If false: throw to monkey 6

Monkey 2:
  Starting items: 82, 74, 97, 75, 51, 92, 83
  Operation: new = old + 5
  Test: divisible by 19
    If true: throw to monkey 7
    If false: throw to monkey 5

Monkey 3:
  Starting items: 97, 88, 51, 68, 76
  Operation: new = old + 6
  Test: divisible by 7
    If true: throw to monkey 0
    If false: throw to monkey 4

Monkey 4:
  Starting items: 63
  Operation: new = old + 1
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1

Monkey 5:
  Starting items: 94, 91, 51, 63
  Operation: new = old + 4
  Test: divisible by 13
    If true: throw to monkey 4
    If false: throw to monkey 3

Monkey 6:
  Starting items: 61, 54, 94, 71, 74, 68, 98, 83
  Operation: new = old + 2
  Test: divisible by 3
    If true: throw to monkey 2
    If false: throw to monkey 7

Monkey 7:
  Starting items: 90, 56
  Operation: new = old * old
  Test: divisible by 11
    If true: throw to monkey 3
    If false: throw to monkey 5
"""

enum Operation {
    case add(Int)           // A value of 0 means multiply by self
    case multiply(Int)
    case none
}

class Monkey {
    init(operation: Operation, test: Int, trueDestination: Int, falseDestination: Int, items: [Int]) {
        self.operation = operation
        self.test = test
        self.trueDestination = trueDestination
        self.falseDestination = falseDestination
        self.items = items
        self.inspected = 0
    }
    
    let operation: Operation
    let test: Int
    let trueDestination: Int
    let falseDestination: Int
    
    var items: [Int]
    
    var inspected: Int
    
    func distributeItems(worryDivider: Int, gcd: Int) -> [(Int, Int)] { // (Item, Destination)
        var tuples: [(Int, Int)] = []
        
        while let item = items.first {
            let worry: Int
            switch operation {
            case .add(let value):
                worry = (item + (value != 0 ? value : item)) / worryDivider
            case .multiply(let value):
                worry = (item * (value != 0 ? value : item)) / worryDivider
            case .none: worry = 0
            }
            
            if worry % test == 0 {
                tuples.append((worry % gcd, trueDestination))
            } else {
                tuples.append((worry % gcd, falseDestination))
            }
            
            items.removeFirst()
            inspected += 1
        }
        
        return tuples
    }
}

var monkeys: [Monkey] {
    input.components(separatedBy: "Monkey")
        .map { $0.components(separatedBy: .newlines) }
        .filter { $0.count > 1 }
        .map { lines in
            let items = lines[1]
                .components(separatedBy: ":")[1]
                .components(separatedBy: ",")
                .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
                .compactMap { Int($0) }
            
            var operation = Operation.none
            var operationParts = lines[2].components(separatedBy: .whitespaces)
            let operationValue = Int(operationParts.removeLast()) ?? 0
            switch operationParts.removeLast() {
            case "*": operation = .multiply(operationValue)
            case "+": operation = .add(operationValue)
            default:
                fatalError()
            }
            
            let test = Int(
                lines[3]
                    .components(separatedBy: .whitespacesAndNewlines)
                    .last ?? ""
            ) ?? 0
            
            let trueDestination = Int(
                lines[4]
                    .components(separatedBy: .whitespacesAndNewlines)
                    .last ?? ""
            ) ?? 0
            
            let falseDestination = Int(
                lines[5]
                    .components(separatedBy: .whitespacesAndNewlines)
                    .last ?? ""
            ) ?? 0
            
            return Monkey(
                operation: operation,
                test: test,
                trueDestination: trueDestination,
                falseDestination: falseDestination,
                items: items
            )
        }
}


