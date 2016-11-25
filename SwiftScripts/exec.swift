#!/usr/bin/swift
//
//  exec.swift
//  SwiftScripts
//
//  Created by iq3 on 2016/11/25.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

import Foundation

let arguments = CommandLine.arguments
if arguments.count > 1 {
    let process = Process()
    process.launchPath = arguments[1]
    process.arguments = arguments[2..<arguments.count].map { $0 }
    process.launch()
    process.terminationHandler = { p in
        switch p.terminationReason{
        case .exit:
            print("complete.")
        case .uncaughtSignal:
            print("fail. status code '\(p.terminationStatus)'")
        }
    }

    while( process.isRunning ){ Thread.sleep(forTimeInterval: 0.1) }
}
else{
    print("usage: exec.swift [command] [arguments...]\n")
}
