//
//  ImageviewExtension.swift
//  MyFirstSlideshow
//
//  Created by Thirumala Rao on 09/07/19.
//  Copyright © 2019 Yoti. All rights reserved.
//

import Foundation
import UIKit

var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        vSpinner = spinnerView
    }
    func removeSpinner(onView:UIView){
        let myParent = onView
        for spinner in myParent.subviews{
            spinner.removeFromSuperview()
        }
    }
    
}
