#!/usr/bin/swift

//
//  Equitable.swift
//  SwiftShells
//
//  Created by iq3 on 2017/07/20.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//
// https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Declarations.html#//apple_ref/doc/uid/TP40014097-CH34-ID380

// Create custom operator
precedencegroup CustomOperatorSettings {
    associativity: left
    lowerThan: AdditionPrecedence
    //higherThan: MultiplicationPrecedence
}
infix operator ❤️ : CustomOperatorSettings
// prefix operator ❤️ : CustomOperatorSettings
// postfix operator ❤️ : CustomOperatorSettings


// Use custom operator
enum Result{
    case notLike
    case oneSideLike
    case bothLike
}
protocol Likeable{
    static func ❤️(left : Self, right : Self) -> Result
}


// Implement
struct Dog {
    let name:String
    let like:String
}
extension Dog : Likeable{
    static func ❤️(left : Dog, right : Dog) -> Result {
        if( left.like  == right.name && right.like == left.name ){
            return Result.bothLike
        }else
        if( left.like  == right.name || right.like == left.name ){
            return Result.oneSideLike
        }
        return Result.notLike
    }
}


// Exam
let dog1 = Dog(name:"john",like:"taro")
let dog2 = Dog(name:"taro",like:"john")

switch dog1 ❤️ dog2 {
case .bothLike:
    print("\(dog1.name) and \(dog2.name) is both like.")
case .oneSideLike:
    print("\(dog1.name) and \(dog2.name) is one side like.")
case .notLike:
    print("\(dog1.name) and \(dog2.name) is not like.")
}

