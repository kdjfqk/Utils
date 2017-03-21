//
//  VideoUtil.swift
//  Monitor
//
//  Created by ldy on 17/3/6.
//  Copyright © 2017年 BJ. All rights reserved.
//

import UIKit
import AVFoundation

class VideoUtil: NSObject {
    
    //获取视频的预览图片
    class func getPreViewImage(url:URL)->UIImage?{
        let asset:AVURLAsset = AVURLAsset(url: url)
        let gen:AVAssetImageGenerator = AVAssetImageGenerator(asset: asset)
        gen.appliesPreferredTrackTransform = true
        //CMTime参数含义：seconds:分子，preferredTimescale：分母，time值=seconds/preferredTimescale
        let time:CMTime = CMTime(seconds: 0, preferredTimescale: 1)
        var actualTime:CMTime = CMTime()
        do{
            let cgImg:CGImage = try gen.copyCGImage(at: time, actualTime: &actualTime)
            let img = UIImage(cgImage: cgImg)
            return img
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
}
