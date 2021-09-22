//
//  DownloadImages.swift
//  CollectionViewAPIwithSQLITEDatabase
//
//  Created by Hamed Amiry on 20.09.2021.
//

import Foundation

class DownloadImage {
    
    static var shared = DownloadImage()
    
    static var images = NSCache<NSString, NSData>()
    
    static func imageDowloag(string: String, complition: @escaping (Data)->()) {
        guard let url = URL(string: string) else {return}
        if let imagedata = images.object(forKey: url.absoluteString as NSString) {
            // print("using cached images")
            complition(imagedata as Data)
            return
        }
        
        let task = URLSession.shared.downloadTask(with: url) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            do {
                let datas = try Data(contentsOf: data)
                self.images.setObject(datas as NSData, forKey: url.absoluteString as NSString)
                complition(datas)
                
            }catch{
                print(error)
            }
        }
        
        task.resume()
        
    }
    
}
