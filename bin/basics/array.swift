#!/usr/bin/swift

//
//  array.swift
//  SwiftShells
//
//  Created by iq3 on 2017/01/05.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

var array = ["value1","value2","value3","value4","value5"]

// Iteration
print("<for in>")
for value in array{
    print("\(value)")
}

print("<map>")
_ = array.map { print("\($0)") }

// Mutating
print("<Add Element>")
array += ["value6"] // array.append("value6")
_ = array.map { print("\($0)") }

print("<Delete Element index 1>")
array[1...1] = [] // array.remove(at:1)
_ = array.map { print("\($0)") }

print("<Replace Element index 2>")
array[2] = "replaced value"
_ = array.map { print("\($0)") }
