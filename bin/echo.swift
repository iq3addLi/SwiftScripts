#!/usr/bin/swift

//
//  echo.swift
//  SwiftScripts
//
//  Created by iq3 on 2016/11/21.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

let arguments = CommandLine.arguments

if arguments.count > 1 { // first argument is filename.
    let arg = arguments[1]
    print("\(arg)")
}else{
    print("no argument")
}
