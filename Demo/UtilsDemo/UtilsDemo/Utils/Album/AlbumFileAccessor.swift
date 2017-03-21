//
//  AlbumFileAccessor.swift
//  YNMonitor
//
//  Created by ldy on 17/3/6.
//  Copyright © 2017年 BJYN. All rights reserved.
//

import UIKit
import Photos

//手机相册 图片、视频 文件存取操作工具类
class AlbumFileAccessor: NSObject {
    
    //保存图片
    class func saveImg(_ img:UIImage,complete:@escaping (_ succ:Bool, _ identifier:String, _ err:Error?)->Void){
        var identifier:String = ""
        PHPhotoLibrary.shared().performChanges({
            let req = PHAssetChangeRequest.creationRequestForAsset(from: img)
            guard let placeholder = req.placeholderForCreatedAsset else { return }
           identifier = placeholder.localIdentifier
        }) { (succ:Bool, err:Error?) in
            complete(succ,identifier,err)
        }
    }
    
    //保存视频
    class func saveVideo(_ path:String,complete:@escaping (_ succ:Bool, _ identifier:String, _ err:Error?)->Void){
        var identifier:String = ""
        PHPhotoLibrary.shared().performChanges({
            let req = PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(string: path)!)
            guard let r = req else { return }
            guard let placeholder = r.placeholderForCreatedAsset else { return }
            identifier = placeholder.localIdentifier
        }) { (succ:Bool, err:Error?) in
            complete(succ,identifier,err)
        }
    }
    
    //加载指定id的图片
    class func loadImg(_ ids:[String], complete:@escaping (_ imgDic:[String:UIImage])->Void){
        var result:[String:UIImage] = [String:UIImage]()
        let fetchResult:PHFetchResult = PHAsset.fetchAssets(withLocalIdentifiers: ids, options: nil)
        if fetchResult.count <= 0 {
            complete(result)
            return
        }
        var count:Int = fetchResult.count
        for i in 0..<fetchResult.count {
            PHImageManager.default().requestImageData(for: fetchResult[i], options: nil, resultHandler: { (imgData:Data?, dataUTI:String?, orientation:UIImageOrientation, info:[AnyHashable : Any]?) in
                if let data = imgData {
                    result[fetchResult[i].localIdentifier] = UIImage(data: data)
                }
                count -= 1
                if count <= 0 {
                    complete(result)
                }
            })
        }
    }
    
    //加载指定id的视频
    class func loadVideo(ids:[String], complete:@escaping (_ videoDic:[String:AVPlayerItem])->Void){
        var result:[String:AVPlayerItem] = [String:AVPlayerItem]()
        let fetchResult:PHFetchResult = PHAsset.fetchAssets(withLocalIdentifiers: ids, options: nil)
        if fetchResult.count <= 0 {
            complete(result)
            return
        }
        var count:Int = fetchResult.count
        for i in 0..<fetchResult.count {
            PHImageManager.default().requestPlayerItem(forVideo: fetchResult[i], options: nil, resultHandler: { (playItem:AVPlayerItem?, info:[AnyHashable : Any]?) in
                if let item = playItem {
                    result[fetchResult[i].localIdentifier] = item
                }
                count -= 1
                if count <= 0 {
                    //回到主线程调用回调函数，否则会加载的很慢
                    DispatchQueue.main.async {
                        complete(result)
                    }
                }
            })
        }
    }
    
    //移除 图片 或 视频
    class func deleteAsset(ids:[String],complete:@escaping (_ succ:Bool, _ err:Error?)->Void){
        let fetchResult:PHFetchResult = PHAsset.fetchAssets(withLocalIdentifiers: ids, options: nil)
        if fetchResult.count <= 0 {
            complete(false,nil)
            return
        }
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.deleteAssets(fetchResult)
        }) { (succ:Bool, err:Error?) in
            complete(succ,err)
        }
    }
}
