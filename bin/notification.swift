#!/usr/bin/swift

//
//  notification.swift
//  SwiftShells
//
//  Created by iq3 on 2017/01/03.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

// This code doesn't work...

import Foundation
import Dispatch

if #available(OSX 10.10, *){
    
class Notificator : NSObject, NSUserNotificationCenterDelegate{
    
    var semaphore : DispatchSemaphore?
    
    override init(){
        print("init.")
        super.init()
        NSUserNotificationCenter.default.delegate = self
    }
    
    func send(){
        print("send.")
        let notif = NSUserNotification()
        notif.title             = "タイトル"
        notif.subtitle          = "サブタイトル"
        notif.informativeText   = "本文"
        notif.userInfo          = ["title" : "タイトル"]
        //notif.deliveryDate = Date().addingTimeInterval(1.0)

        DispatchQueue.global(qos: .default ).async( execute: {
            NSUserNotificationCenter.default.deliver(notif)
            //NSUserNotificationCenter.default.scheduleNotification(notif)
        })
    }
    
    func wait(){
        print("wait.")
        let semaphore   = DispatchSemaphore(value: 0)
        self.semaphore  = semaphore
        let _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
    
    public func userNotificationCenter(_ center: NSUserNotificationCenter, didDeliver notification: NSUserNotification){
        if let info = notification.userInfo{
            print(info["title"]!)
        }
        
        if let semaphore = self.semaphore{
            semaphore.signal()
        }
    }
    
    public func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool{
        print("delegate worked.")
        return true
    }
}

let notificator = Notificator();
notificator.send()
notificator.wait()

}
