//
//  ViewController.swift
//  CABasicAnimation
//
//  Created by  Mazy on 2017/5/11.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bezierPath = UIBezierPath()
        let width = containerView.bounds.width
        let height = containerView.bounds.height
        bezierPath.move(to: CGPoint(x: 30, y: 150))
        bezierPath.addCurve(to: CGPoint(x: width-30, y: 150), controlPoint1: CGPoint(x: (width-100)/3+50, y: 0), controlPoint2: CGPoint(x: (width-100)/3*2+50, y: height))
        
        let pathLayer = CAShapeLayer()
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.lineWidth = 3.0
        
        containerView.layer.addSublayer(pathLayer)
        
        let plainLayer = CALayer()
        plainLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        plainLayer.position = CGPoint(x: 30, y: 150)
        plainLayer.contents = UIImage(named: "plain")?.cgImage
        plainLayer.transform = CATransform3DMakeRotation(CGFloat(M_PI_4/2), 0, 0, 1)
        containerView.layer.addSublayer(plainLayer)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.duration = 4.0
        animation.path = bezierPath.cgPath
        animation.rotationMode = kCAAnimationRotateAuto
        animation.repeatCount = MAXFLOAT
        plainLayer.add(animation, forKey: nil)
        
        animationGroup()
        
    }
    
    func animationGroup() {
        let bezierPath = UIBezierPath()
        let width = containerView.bounds.width
        let height = containerView.bounds.height
        bezierPath.move(to: CGPoint(x: 30, y: 30))
        bezierPath.addLine(to: CGPoint(x: width-30, y: 30))
        bezierPath.addLine(to: CGPoint(x: width-30, y: height-30))
        bezierPath.addLine(to: CGPoint(x: 30, y: height-30))
        bezierPath.close()
        
        let pathLayer = CAShapeLayer()
        pathLayer.path = bezierPath.cgPath
        pathLayer.fillColor = UIColor.clear.cgColor
        pathLayer.strokeColor = UIColor.red.cgColor
        pathLayer.lineWidth = 3.0
        
        containerView.layer.addSublayer(pathLayer)
        
        let plainLayer = CALayer()
        plainLayer.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        plainLayer.position = CGPoint(x: 30, y: 30)
        plainLayer.contents = UIImage(named: "飞机")?.cgImage
        containerView.layer.addSublayer(plainLayer)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.path = bezierPath.cgPath
        animation.rotationMode = kCAAnimationRotateAuto
        
        let animation2 = CABasicAnimation()
        animation2.keyPath = "backgroundColor"
        animation2.toValue = UIColor.red.cgColor
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation,animation2]
        groupAnimation.duration = 4.0
        groupAnimation.repeatCount = MAXFLOAT
        plainLayer.add(groupAnimation, forKey: nil)
    }


}

