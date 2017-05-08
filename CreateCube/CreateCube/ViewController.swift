//
//  ViewController.swift
//  CreateCube
//
//  Created by  Mazy on 2017/5/8.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var faces: [FaceView] = [FaceView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let face1 = Bundle.main.loadNibNamed("FaceView", owner: nil, options: nil)?[0] as! FaceView
        let face2 = Bundle.main.loadNibNamed("FaceView", owner: nil, options: nil)?[1] as! FaceView
        let face3 = Bundle.main.loadNibNamed("FaceView", owner: nil, options: nil)?[2] as! FaceView
        let face4 = Bundle.main.loadNibNamed("FaceView", owner: nil, options: nil)?[3] as! FaceView
        let face5 = Bundle.main.loadNibNamed("FaceView", owner: nil, options: nil)?[4] as! FaceView
        let face6 = Bundle.main.loadNibNamed("FaceView", owner: nil, options: nil)?[5] as! FaceView
        
        faces.append(contentsOf: [face1,face2,face3,face4,face5,face6])
        
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0/500
        perspective = CATransform3DRotate(perspective, CGFloat(-M_PI_4), 1, 0, 0)
        perspective = CATransform3DRotate(perspective, CGFloat(-M_PI_4), 0, 1, 0)
        containerView.layer.sublayerTransform = perspective
        
        let distance: CGFloat = 100
        
        // add cube face1
        var transform = CATransform3DMakeTranslation(0, 0, distance)
        addFace(with: face1, transform: transform)
        
        // add cube face2
        transform = CATransform3DMakeTranslation(distance, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 0, 1, 0)
        addFace(with: faces[1], transform: transform)
        
        // add cube face3
        transform = CATransform3DMakeTranslation(0, -distance, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI_2), 1, 0, 0)
        addFace(with: face3, transform: transform)
        
        // add cube face4
        transform = CATransform3DMakeTranslation(0, distance, 0)
        transform = CATransform3DRotate(transform, CGFloat(-M_PI_2), 1, 0, 0)
        addFace(with: face4, transform: transform)
        
        // add cube face5
        transform = CATransform3DMakeTranslation( -distance, 0, 0)
        transform = CATransform3DRotate(transform, CGFloat(-M_PI_2), 0, 1, 0)
        addFace(with: face5, transform: transform)
        
        // add cube face6
        transform = CATransform3DMakeTranslation(0, 0, -distance)
        transform = CATransform3DRotate(transform, CGFloat(M_PI), 0, 1, 0)
        addFace(with: face6, transform: transform)
        
        
    }
    
    func addFace(with face: FaceView,transform: CATransform3D) {
        
        face.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        containerView.addSubview(face)
        
        let size = containerView.bounds.size
        
        face.center = CGPoint(x: size.width/2, y: size.height/2)
        
        face.layer.transform = transform

    }


}

