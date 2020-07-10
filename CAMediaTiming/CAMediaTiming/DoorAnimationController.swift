//
//  DoorAnimationController.swift
//  CAMediaTiming
//
//  Created by Mazy on 2017/5/17.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class DoorAnimationController: UIViewController {

    @IBOutlet weak var doorImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        doorImageView.layer.anchorPoint = CGPoint(x: 1, y: 0.5)
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1/500.0
        doorImageView.layer.sublayerTransform = perspective
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation.y"
        animation.toValue = -M_PI_2
        animation.duration = 2
        // 动画重复一个指定的时间，而不是指定次数
        animation.repeatDuration = 14.0
        // 返回
        animation.autoreverses = true
        doorImageView.layer.add(animation, forKey: nil)
    }

}
