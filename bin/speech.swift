#!/usr/bin/swift

//
//  speech.swift
//  SwiftShells
//
//  Created by iq3 on 2017/01/03.
//  Copyright © 2017年 addli.co.jp. All rights reserved.
//

import Foundation
//import AVFoundation

struct Error : Swift.Error{
    let reason:String
}

if #available(OSX 10.10, *){
    
    do{
        // MacOS framework does not contain AVSpeechSynthesizer. Use SiriKit.
        /*
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: "test")
        
        utterance.rate = AVSpeechUtteranceMinimumSpeechRate
        utterance.pitchMultiplier = 1
        utterance.volume = 1.0
        
        let voice = AVSpeechSynthesisVoice()
        utterance.voice = voice

        synthesizer.speakUtterance(utterance)
         */
    }catch let e as Error{
        print("error:\(e.reason)")
    }
    
}
