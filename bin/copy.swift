#!/usr/bin/swift

//
//  copy.swift
//  SwiftScripts
//
//  Created by iq3 on 2016/11/21.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

import Foundation

let arguments = CommandLine.arguments
let fileManager = FileManager.default

func filepath(_ path:String ) -> String{
    
    switch path.substring(to: path.index( path.startIndex, offsetBy: 1)){
    case ".":
        let start = path.characters.index(path.characters.startIndex, offsetBy: 0)
        let end   = path.characters.index(start, offsetBy: 1)
        return path.replacingCharacters(in: start ..< end, with: fileManager.currentDirectoryPath )
    case "/":
        return path
    default:
        return fileManager.currentDirectoryPath + "/" + path
    }
}

if arguments.count > 2 {
    let target = filepath(arguments[1])
    let dist   = filepath(arguments[2])
    
    do{
        try fileManager.copyItem(atPath: target, toPath: dist)
    }catch{
        print("error: \(error)")
    }
}else{
    // usage
    print("\(arguments[0]) [target path] [destination path]")
}

