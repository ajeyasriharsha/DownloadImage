//
//  AsyncImageView.swift
//  MyFirstSlideshow
//
//  Created by Ajeya Sriharsha on 7/9/19.
//  Copyright © 2019 Yoti. All rights reserved.
//

import Foundation
import UIKit


var asyncImagesCashArray = NSCache<NSString, UIImage>()
class AsyncDownload
{
    
    typealias CompletionHandler = (_ success:Bool, _ image:UIImage?) -> Void
    
    func loadImageUsingCacheWithUrlString(_ urlString:
        String,completionHandler: @escaping CompletionHandler) {
        var image = UIImage()
        
        //check cache for image first

        if let cashedImage = asyncImagesCashArray.object(forKey: urlString as NSString)
        {
            image = cashedImage
            print("Returning from Cache")
            completionHandler(true, image)
            return
        }
        guard let requestURL = URL(string: urlString) else { completionHandler(false,nil); return }
        URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            DispatchQueue.main.async {
                if error == nil {
                    if let imageData = data {
                        
                        if let imageToPresent = UIImage(data: imageData) {
                            asyncImagesCashArray.setObject(imageToPresent, forKey: urlString as NSString)
                            
                            completionHandler(true,imageToPresent)
                        } else {
                            completionHandler(false,nil)
                        }
                        
                    }
                    else {
                        completionHandler(false,nil)
                    }
                } else {

                    completionHandler(false,nil)
                }
            }
            }.resume()
        
    }
    
    
   
}
