#!/usr/bin/swift

//
//  zip.swift
//  SwiftShells
//
//  Created by iq3 on 2016/11/28.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

import Foundation

let arguments = CommandLine.arguments
if arguments.count > 1
{
    let process = Process()
    process.launchPath = "/usr/bin/zip"
    process.arguments = arguments[1..<arguments.count].map { $0 }
    process.terminationHandler = { p in
        switch p.terminationReason{
        case .exit:
            if FileManager.default.fileExists(atPath: arguments[1]){
                print("complete.")
            }else{
                print("file create failed.")
            }
            
        case .uncaughtSignal:
            print("fail. status code '\(p.terminationStatus)'")
        }
    }
    process.launch()
    
    while( process.isRunning ){ Thread.sleep(forTimeInterval: 0.1) }
}
else{
    print("usage: zip.swift [zip file path] [target file path]\n")
}
