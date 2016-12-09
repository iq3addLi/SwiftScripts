#!/usr/bin/swift

//
//  discadable.swift
//  SwiftShells
//
//  Created by iq3 on 2016/12/09.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

@discardableResult func discardableOutput() -> String{
//  func discardableOutput() -> @discardable String{  // Future? https://github.com/apple/swift-evolution/blob/master/proposals/0047-nonvoid-warn.md
    return "test"
}

func output() ->  String{
    return "test"
}

discardableOutput()
output()
