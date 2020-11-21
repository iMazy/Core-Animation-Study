//
//  TimeOffsetViewController.swift
//  CAMediaTiming
//
//  Created by Mazy on 2017/5/17.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class TimeOffsetViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var timeOffsetSlider: UISlider!
    
    @IBOutlet weak var timeOffsetLabel: UILabel!
    
    @IBOutlet weak var speedSlider: UISlider!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    var isFillMode: Bool = false
    
    var bezierPath = UIBezierPath()
    var plainLayer = CALayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let bezierPath = UIBezierPath()
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

//        let plainLayer = CALayer()
        plainLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        plainLayer.position = CGPoint(x: 30, y: 150)
        plainLayer.contents = UIImage(named: "plain")?.cgImage
        plainLayer.transform = CATransform3DMakeRotation(CGFloat(Double.pi / 4/2), 0, 0, 1)
        containerView.layer.addSublayer(plainLayer)

        timeOffsetSlider.addTarget(self, action: #selector(updateSliders), for: .valueChanged)
        speedSlider.addTarget(self, action: #selector(updateSliders), for: .valueChanged)
        
    }

    @objc func updateSliders(slider: UISlider) {
        
        let value = String(format: "%.02f", slider.value)
        if slider == timeOffsetSlider {
            timeOffsetLabel.text = value
        } else {
            speedLabel.text = value
        }
    }
    
    @IBAction func palyAction(_ sender: UIButton) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position"
        animation.timeOffset = CFTimeInterval(timeOffsetSlider.value)
        animation.speed = speedSlider.value
        animation.duration = 1.0
        animation.path = bezierPath.cgPath
        animation.rotationMode = CAAnimationRotationMode.rotateAuto
        animation.isRemovedOnCompletion = false
        
        if isFillMode {
            /*
             kCAFillModeForwards
             kCAFillModeBackwards
             kCAFillModeBoth
             kCAFillModeRemoved // default
             */
            animation.fillMode = CAMediaTimingFillMode.forwards
        }
        
        plainLayer.add(animation, forKey: nil)
    }
    
    
}
