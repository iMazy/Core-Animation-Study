//
//  ViewController.swift
//  CATransform3D
//
//  Created by  Mazy on 2017/5/5.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewA: UIImageView!
    
    @IBOutlet weak var imageViewB: UIImageView!
    
    @IBOutlet weak var imageViewC: UIImageView!
    
    @IBOutlet weak var imageViewD: UIImageView!
    
    @IBAction func rotationAction() {
        
        /// 3D旋转，参数一：角度，参数二：绕着x轴旋转，参数三：绕着y轴旋转，参数四：绕着z轴旋转
        /// 此方法可以获取一个视图的对称视图
        let transform3D = CATransform3DMakeRotation(CGFloat(Double.pi), 1, 1, 1)
        imageViewA.layer.transform = transform3D
        
    }

    @IBAction func scaleAction() {
        
        /// X,Y,Z 三轴缩放比例
        let transform3D = CATransform3DMakeScale(0.5, 1.5, 1)
        imageViewB.layer.transform = transform3D
    }
   
    @IBAction func translationAction() {
        
        /// 移动 跟 CGAffineTransform 一样，多了一个 z 方向的
        let transform3D = CATransform3DMakeTranslation(100, 50, 50)
        imageViewC.layer.transform = transform3D
    }
    
    @IBAction func multyAction() {
        var transform3D = CATransform3DIdentity
        transform3D = CATransform3DScale(transform3D, 0.5, 0.5, 1)
        transform3D = CATransform3DRotate(transform3D, 1, 1, 1, 1)
        transform3D = CATransform3DTranslate(transform3D, 100, 50, 50)
        imageViewD.layer.transform = transform3D
    }
    

}

