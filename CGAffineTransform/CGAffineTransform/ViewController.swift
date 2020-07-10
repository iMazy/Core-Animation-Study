//
//  ViewController.swift
//  CGAffineTransform
//
//  Created by  Mazy on 2017/5/4.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewA: UIImageView!
    
    @IBOutlet weak var imageViewB: UIImageView!

    @IBOutlet weak var imageViewC: UIImageView!
    
    @IBOutlet weak var imageViewD: UIImageView!
    
    var angle: CGFloat = 0
    var scale: CGFloat = 1
    var translation: CGFloat = 0
    
    @IBAction func imageViewA_Action() {
        angle = angle + CGFloat(M_PI_4)
        let transform = CGAffineTransform(rotationAngle: angle)
        imageViewA.layer.setAffineTransform(transform)
    }
    
    
    @IBAction func imageViewB_Action() {
        
        scale = scale < 0  ? scale + 0.1 : scale - 0.1
        
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        imageViewB.layer.setAffineTransform(transform)
    }
    
    @IBAction func imageViewC_Action() {
        translation = translation > 200 ? translation - 10 : translation + 10
        let transform = CGAffineTransform(translationX: translation, y: translation)
        imageViewC.layer.setAffineTransform(transform)
    }
    
    /// 混合变换
    @IBAction func imageViewD_Action() {
        
        var transform = CGAffineTransform.identity
        
        transform = transform.scaledBy(x: 0.5, y: 0.5)
        transform = transform.rotated(by: CGFloat(M_PI_4))
        transform = transform.translatedBy(x: 200, y: 50)
        
        imageViewD.layer.setAffineTransform(transform)
    }

}

