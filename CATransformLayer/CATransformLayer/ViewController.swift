//
//  ViewController.swift
//  CATransformLayer
//
//  Created by  Mazy on 2017/5/9.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0/500.0
        containerView.layer.sublayerTransform = pt
        
        var c1t = CATransform3DIdentity
        c1t = CATransform3DTranslate(c1t, 0, 100, 0)
        c1t = CATransform3DRotate(c1t, CGFloat(Double.pi / 4), 0, 1, 0)
        let cube1 = cubeWithTransform(transform: c1t)
        
        containerView.layer.addSublayer(cube1)
        
        var c2t = CATransform3DIdentity
        c2t = CATransform3DTranslate(c2t, 0, -100, 0)
        c2t = CATransform3DRotate(c2t, CGFloat(-Double.pi/4), 1, 0, 0)
        c2t = CATransform3DRotate(c2t, CGFloat(-Double.pi/4), 0, 1, 0)
        let cube2 = cubeWithTransform(transform: c2t)
        containerView.layer.addSublayer(cube2)
    }
    
    func faceWithTransform(transform: CATransform3D) -> CALayer {
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        face.backgroundColor = UIColor.random().cgColor
        
        face.transform = transform
        return face
    }
    
    func cubeWithTransform(transform: CATransform3D) -> CATransformLayer {
        // create cube layer
        let cube = CATransformLayer()
        let distance: CGFloat = 50
        
        let size = containerView.bounds.size
        
        cube.position = CGPoint(x: size.width/2, y: size.height/2)
        
        cube.transform = transform
        
        // add cube face1
        var transform = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(faceWithTransform(transform: transform))
        
        // add cube face2
        transform = CATransform3DMakeTranslation(distance, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi/2), 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: transform))
        
        // add cube face3
        transform = CATransform3DMakeTranslation(0, -distance, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi/2), 1, 0, 0)
        cube.addSublayer(faceWithTransform(transform: transform))
        
        // add cube face4
        transform = CATransform3DMakeTranslation(0, distance, 0)
        transform = CATransform3DRotate(transform, CGFloat(-Double.pi/2), 1, 0, 0)
        cube.addSublayer(faceWithTransform(transform: transform))
        
        // add cube face5
        transform = CATransform3DMakeTranslation( -distance, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat(-Double.pi/2), 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: transform))
        
        // add cube face6
        transform = CATransform3DMakeTranslation(0, 0, -distance)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi), 0, 1, 0)
        cube.addSublayer(faceWithTransform(transform: transform))

        
        
        return cube
        
    }

}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
