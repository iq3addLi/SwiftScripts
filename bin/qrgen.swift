#!/usr/bin/swift

//
//  qrgen.swift
//  SwiftShells
//
//  Created by iq3 on 2016/12/12.
//  Copyright © 2016年 addli.co.jp. All rights reserved.
//

import CoreImage

extension CGImage {
    
    func writeToFile(path:String) -> Bool {
        
        let url = URL(fileURLWithPath: path) as CFURL
        
        // Create ImageDestination
        guard let destination = CGImageDestinationCreateWithURL(url, kUTTypePNG, 1, nil) else {
            print( "Failed to create CGImageDestination for \(path)" )
            return false
        }
        
        // Add Image
        CGImageDestinationAddImage(destination, self, nil)
        
        // Finalize ImageDestination
        if (!CGImageDestinationFinalize(destination)) {
            print( "Failed to write image to \(path)")
            return false
        }
        
        return true
    }
}

struct Error : Swift.Error{
    let reason:String
}


if #available(OSX 10.10, *){
    do{
        // Parse aguments
        let arguments = CommandLine.arguments
        if arguments.count <= 1 {
            throw Error(reason:"\nusage: qrgen.swift [encode string] [destination image file name]\n")
        }
        let string = arguments[1]
        let filename:String
        if arguments.count > 2 { filename = arguments[2] } else {
            filename = "qrcode.png"
        }
        
        // Exchange from String to image of qrcode
        guard let data = string.data(using: .utf8) else {
            throw Error(reason:"unsupport string encode.")
        }
        guard let qr = CIFilter(name: "CIQRCodeGenerator", withInputParameters: ["inputMessage": data, "inputCorrectionLevel": "H"]), let outputImage = qr.outputImage else {
            throw Error(reason:"image output failed")
        }
        
        // Expanded Image
        let sizeTransform = CGAffineTransform(scaleX:4, y:4)
        let qrImage = outputImage.applying(sizeTransform)
        
        // CIImage to CGImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(qrImage, from: qrImage.extent) else {
            throw Error(reason:"CIImage to CGImage failed")
        }
        
        // Save CGImage
        if cgImage.writeToFile( path:filename ) == false{
            throw Error(reason:"image save failed")
        }else{
            print("complete.")
        }
    }catch let e as Error{
        print("error:\(e.reason)")
    }
}
else{
    print("Unsupported OS Version\n")
}
