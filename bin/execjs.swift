#!/usr/bin/swift

//
//  execjs.swift
//  SwiftShells
//
//  Created by iq3 on 2017/01/03.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

import Foundation
import JavaScriptCore


// Closure
let output : @convention(block) (String) -> Void = {
    print("\($0)");
}

// ObjC Class doesn't work...
/*
@objc protocol JSLogInterface : JSExport{
    func log(_ msg:String )
}

class JSLog : NSObject, JSLogInterface{
    func log(_ msg:String ){
        print("\(msg)");
    }
}
*/

let vm = JSVirtualMachine()
if let context = JSContext(virtualMachine: vm){
    context.exceptionHandler = { ctx, error in
        print("JS Exc: \(error)")
    };
    
    // closure
    context.setObject( unsafeBitCast(output, to: AnyObject.self ),
                      forKeyedSubscript: "output" as NSString )
    context.evaluateScript("output('Hello Built in JS!')")
    
    // ObjC class doesn't work...
//    context.setObject(JSLog(),
//                      forKeyedSubscript: "logger" as NSString )
//    context.evaluateScript("logger.log('Hello Built in JS!')")
    
}else{
    print("JSContext init failed.")
}
