//
//  SublayerViewController.swift
//  CATransform3D
//
//  Created by  Mazy on 2017/5/5.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class SublayerViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageViewA: UIImageView!
    @IBOutlet weak var imageViewB: UIImageView!
    @IBOutlet weak var imageViewC: UIImageView!
    @IBOutlet weak var imageViewD: UIImageView!
    
    
    @IBAction func beginSublayerAction() {
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0/200
        containerView.layer.sublayerTransform = perspective
        
        imageViewA.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi/4), 0, 1, 0)
        imageViewB.layer.transform = CATransform3DMakeRotation(CGFloat(-Double.pi/4), 0, 1, 0)
        imageViewC.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi/4), 0, 1, 0)
        imageViewD.layer.transform = CATransform3DMakeRotation(CGFloat(-Double.pi/4), 0, 1, 0)
        
    }
    
    @IBOutlet weak var imageViewE: UIImageView!
    
    @IBAction func beginMirrorAction() {
        let transform3D = CATransform3DMakeRotation(CGFloat(Double.pi), 0, 1, 0)
        imageViewE.layer.transform = transform3D
    }

}
