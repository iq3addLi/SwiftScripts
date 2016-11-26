#!/usr/bin/swift
//
//  scanf.swift
//  SwiftScripts
//
//  Created by iq3 on 2016/11/24.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

import Foundation


let input   = FileHandle.standardInput

print("[Input]")
let str     = String(data: input.availableData, encoding: .utf8) // wait here
print("[Done]")

if let str = str {
    print("Result = \(str)")
}
else {
    print("Result = error")
}
