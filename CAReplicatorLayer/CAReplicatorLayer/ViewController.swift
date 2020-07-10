//
//  ViewController.swift
//  CAReplicatorLayer
//
//  Created by  Mazy on 2017/5/9.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var indicitorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // create replicator layer and add it to containerView
        let replicator = CAReplicatorLayer()
        replicator.frame = containerView.bounds
        containerView.layer.addSublayer(replicator)
        
        
        let width: CGFloat = 70
        // config the replicator
        replicator.instanceCount = 10
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, width*2, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI/5), 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -2*width, 0)
        replicator.instanceTransform = transform
        
        replicator.instanceBlueOffset = -0.1
        replicator.instanceGreenOffset = -0.1
        
        // create a sublayer and place it inside the replicator
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: width)
        layer.backgroundColor = UIColor.white.cgColor
        replicator.addSublayer(layer)
        
        
        addCircle()
    }
    
    func addCircle() {
        let replicator = CAReplicatorLayer()
        replicator.frame = indicitorView.bounds
        indicitorView.layer.addSublayer(replicator)
        
        
        let width: CGFloat = 20
        // config the replicator
        replicator.instanceCount = 60
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, width*3, 0)
        transform = CATransform3DRotate(transform, CGFloat(M_PI/30), 0, 0, 1)
        transform = CATransform3DTranslate(transform, 0, -3*width, 0)
        replicator.instanceTransform = transform
        
        replicator.instanceBlueOffset = -1/60
        replicator.instanceGreenOffset = -1/60
        
        // create a sublayer and place it inside the replicator
        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: width, height: width)
        layer.backgroundColor = UIColor.white.cgColor
        replicator.addSublayer(layer)

    }


}

