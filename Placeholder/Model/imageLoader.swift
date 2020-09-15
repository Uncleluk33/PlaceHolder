//
//  imageLoader.swift
//  Placeholder
//
//  Created by Lucas Clahar on 9/11/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//
 
import Foundation
import UIKit

class ImageLoader{
    
    
   static let cache = NSCache<NSString, UIImage>()
    
    //create URL session and asign session task that fetches a image from URL
   static func imageDownloader(withURL urlString: String, completion: @escaping (_ Image: UIImage?) -> ()) {
    if let url = URL(string: urlString) {
        let datatask = URLSession.shared.dataTask(with: url) { (data, response, err) in
            var downloadedimage: UIImage?
            
            //save UIimage to variable
            if let data = data {
                downloadedimage = UIImage(data: data)
            }
            // ceck if a image came back and store image in cache
            if downloadedimage != nil {
                cache.setObject(downloadedimage!, forKey: url.absoluteString as NSString)
            }
            
            DispatchQueue.main.async {
                completion(downloadedimage)
            }
        }
        datatask.resume()
    }
        
    
    }
        
    static func getImage(withURL urlString: String, completion: @escaping (_ Image: UIImage?) -> ()) {
        if let url = URL(string: urlString) {
            // check if cached image is available and return it, else return image that was downloaded
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(image)
        }else {
            
            imageDownloader(withURL: urlString, completion: completion)
        }
        }
    }

    
}

