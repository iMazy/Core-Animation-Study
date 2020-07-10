//
//  M34ViewController.swift
//  CATransform3D
//
//  Created by  Mazy on 2017/5/5.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class M34ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
   
    @IBAction func m34Action() {
        var transform3D = CATransform3DIdentity
        /// .m34 = -1.0/d
        /// d代表了想象中视角相机和屏幕之间的距离，以像素为单位
        /// d越小，变化越大
        transform3D.m34 = -1.0/200
        transform3D = CATransform3DRotate(transform3D, CGFloat(M_PI_4), 0, 1, 0)
        imageView.layer.transform = transform3D
    }

}
