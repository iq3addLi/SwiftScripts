#!/usr/bin/swift

//
//  cat.swift
//  SwiftShells
//
//  Created by Arakane Ikumi on 2016/11/26.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

import Foundation

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

let arguments = CommandLine.arguments
if arguments.count == 3,arguments[1] == "hex" {
    let target = filepath(arguments[2])
    
    if let url = URL(string:target), let data = try? Data(contentsOf:url ){
        print("\(data)")
    }
    else{ print("error.") }
}
else if arguments.count == 2{
    let target = filepath(arguments[1])
    
    if let str = try? String(contentsOfFile:target, encoding:.utf8){
        print("\(str)")
    }
    else{ print("error.") }

}else{
    // usage
    print("\(arguments[0]) [hex] [file path]")
}
