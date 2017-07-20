#!/usr/bin/swift

//
//  Equitable.swift
//  SwiftShells
//
//  Created by iq3 on 2017/07/20.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

struct Dog {
    let name:String
}

extension Dog: Equatable {
    static func == (left : Dog, right : Dog) -> Bool {
        return left.name == right.name
    }
}

let john = Dog(name:"john")
let taro = Dog(name:"taro")

if john == taro {
    print("Two dogs is equal.")
}else{
    print("Two dogs is not equal.")
}
