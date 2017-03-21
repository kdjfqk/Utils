//
//  c.swift
//  YNMonitor
//
//  Created by ldy on 17/3/2.
//  Copyright © 2017年 BJYN. All rights reserved.
//

import UIKit
import Photos

let AlbumImgIDsKey = "AlbumImgIDsKey"
let AlbumVideoIDsKey = "AlbumVideoIDsKey"

class AlbumManager: NSObject {
    
    var imgIDs:[String] = []
    var videoIDs:[String] = []
    
    static var shared:AlbumManager = AlbumManager()
    fileprivate override init() {
        super.init()
        //从UserDefaults加载img id & video id
        if let ids = UserDefaults.standard.object(forKey: AlbumImgIDsKey) as? [String] {
            self.imgIDs = ids
        }
        if let ids = UserDefaults.standard.object(forKey: AlbumVideoIDsKey) as? [String] {
            self.videoIDs = ids
        }
    }
    
    /// 保存图片到相册，并将得到的该图片本地id存到UserDefault中
    ///
    /// - parameter img:      要保存的图片
    /// - parameter complete: 保存完成后的回调
    func saveImgToAlbum(_ img:UIImage,complete:@escaping (_ succ:Bool, _ err:Error?)->Void){
        AlbumFileAccessor.saveImg(img) { (succ:Bool, identifier:String, err:Error?) in
            if succ == true {
                self.imgIDs.append(identifier)
                //更新UserDefaults值
                UserDefaults.standard.set(self.imgIDs, forKey: AlbumImgIDsKey)
                UserDefaults.standard.synchronize()
            }
            complete(succ,err)
        }
    }
    
    /// 保存视频到相册，并将得到的该视频本地id存到UserDefault中
    ///
    /// - parameter path:     要保存的视频文件的路径
    /// - parameter complete: 保存完成后的回调
    func saveVideoToAlbum(_ path:String,complete:@escaping (_ succ:Bool, _ err:Error?)->Void){
        AlbumFileAccessor.saveVideo(path) { (succ:Bool, identifier:String, err:Error?) in
            if succ == true {
                self.videoIDs.append(identifier)
                //更新UserDefaults值
                UserDefaults.standard.set(self.videoIDs, forKey: AlbumVideoIDsKey)
                UserDefaults.standard.synchronize()
            }
            complete(succ,err)
        }
    }
    
    /// 从相册中加载UserDefault中所有图片id对应的图片
    ///
    /// - parameter complete: 加载完成后的回调，返回字典：key为id，value为UIImage
    func loadImgFromAlbum(_ complete:@escaping (_ imgDic:[String:UIImage])->Void){
        AlbumFileAccessor.loadImg(imgIDs, complete: complete)
    }
    
    /// 从相册中加载UserDefault中所有视频id对应的视频
    ///
    /// - parameter complete: 加载完成后的回调，返回字典：key为id，value为AVPlayerItem
    func loadVideoFromAlbum(_ complete:@escaping (_ videoDic:[String:AVPlayerItem])->Void){
        AlbumFileAccessor.loadVideo(ids: videoIDs, complete: complete)
    }
    
    /// 删除相册中指定id的图片
    ///
    /// - parameter imgId:    img id
    /// - parameter complete:删除完成后的回调
    func deleteImg(_ imgId:String,complete:@escaping (_ succ:Bool, _ err:Error?)->Void){
        AlbumFileAccessor.deleteAsset(ids: [imgId]) { (succ:Bool, err:Error?) in
            if succ {
                if let index = self.imgIDs.index(of: imgId) {
                    self.imgIDs.remove(at: index)
                    UserDefaults.standard.set(self.imgIDs, forKey:AlbumImgIDsKey)
                    UserDefaults.standard.synchronize()
                }
            }
            complete(succ,err)
        }
    }
    
    /// 删除相册中指定id的视频
    ///
    /// - parameter videoId:  Video id
    /// - parameter complete: 删除完成后的回调
    func deleteVideo(_ videoId:String,complete:@escaping (_ succ:Bool, _ err:Error?)->Void){
        AlbumFileAccessor.deleteAsset(ids: [videoId]) { (succ:Bool, err:Error?) in
            if succ {
                if let index = self.videoIDs.index(of: videoId) {
                    self.videoIDs.remove(at: index)
                    UserDefaults.standard.set(self.videoIDs, forKey:AlbumVideoIDsKey)
                    UserDefaults.standard.synchronize()
                }
            }
            complete(succ,err)
        }
    }
}
