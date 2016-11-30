#!/usr/bin/swift

//
//  random.swift
//  SwiftShells
//
//  Created by iq3 on 2016/11/30.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

// Linux/Mac Compartible

#if os(Linux)
import Glibc

// Set random seed
let file = fopen("/dev/urandom", "r")
var bytes = [Int8](repeating: 0, count: 4 + 1)
fgets(&bytes, 4 + 1, file)
bytes.removeLast()
let num = UnsafeMutableRawPointer(mutating: bytes).assumingMemoryBound(to: UInt32.self).pointee
srandom(num)

// Generate random number
let rand = random()

#elseif os(macOS)
let rand = arc4random_uniform(UINT32_MAX)
    
#else
print("This platform is unsupport.")
exit(0)
    
#endif
    
// random output
print("\(rand)")

