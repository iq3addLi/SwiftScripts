#!/usr/bin/swift

//
//  substring.swift
//  SwiftScripts
//
//  Created by iq3 on 2016/11/23.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

func substring(_ arguments:[String]) -> String?{
    guard arguments.count == 4 else{ return nil }
    let string = arguments[1]
    guard let location = Int(arguments[2]) else { return nil }
    guard let length = Int(arguments[3]) else { return nil }
    if string.characters.count < location + length { return nil }
    
    let start = string.index( string.startIndex, offsetBy: location )
    let end   = string.index( start, offsetBy: length - 1)
    
    return string[start ... end]
}

if let str = substring(CommandLine.arguments){
    print("\(str)")
}
else{
    print("usage: [string] [location] [length]\n")
}
