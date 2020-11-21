//
//  ViewController.swift
//  CAGradientLayer
//
//  Created by  Mazy on 2017/5/9.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     CAGradientLayer是用来生成两种或更多颜色平滑渐变的
     */
    @IBOutlet weak var containerView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // point
        let sPoint1 = CGPoint(x: 0, y: 0.5)
        let ePoint1 = CGPoint(x: 1, y: 0.5)
        
        // point
        let sPoint2 = CGPoint(x: 0.5, y: 0)
        let ePoint2 = CGPoint(x: 0.5, y: 1)
        
        // point
        let sPoint3 = CGPoint(x: 0, y: 0)
        let ePoint3 = CGPoint(x: 1, y: 1)
        // point
        let sPoint4 = CGPoint(x: 1, y: 0)
        let ePoint4 = CGPoint(x: 0, y: 1)
    
        
        let colors1 = [UIColor.red.cgColor,UIColor.green.cgColor]
        let colors2 = [UIColor.red.cgColor,
                       UIColor.orange.cgColor,
                       UIColor.yellow.cgColor,
                       UIColor.green.cgColor,
                       UIColor.blue.cgColor,
                       UIColor.brown.cgColor,
                       UIColor.purple.cgColor]
        
        
        // hort
        addGradient(with: 0, colors: colors1, startPoint: sPoint1, endPoint: ePoint1)
        // vert
        addGradient(with: 1, colors: colors1, startPoint: sPoint2, endPoint: ePoint2)
        //
        addGradient(with: 2, colors: colors2, startPoint: sPoint3, endPoint: ePoint3)
        //
        addGradient(with: 3, colors: colors2, startPoint: sPoint4, endPoint: ePoint4)
        
        // add locations to gradient
        completeGradientWithLocations()
    }
    
    func simpleGradient() {
        // create gradient layer and add it to containerView
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = (containerView.subviews.first?.bounds)!
        containerView.subviews.first?.layer.addSublayer(gradientLayer)
        
        // set gradient color
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.green.cgColor]
        
        // set gradient start and end points
        // start and end point range [0,1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
    }
    
    func completeGradientWithLocations() {
        // create gradient layer and add it to containerView
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = (containerView.subviews.last?.bounds)!
        containerView.subviews.last?.layer.addSublayer(gradientLayer)
        
        // set gradient color
        gradientLayer.colors = [UIColor.red.cgColor,
//                                UIColor.orange.cgColor,
//                                UIColor.yellow.cgColor,
                                UIColor.green.cgColor,
//                                UIColor.blue.cgColor,
//                                UIColor.brown.cgColor,
                                UIColor.purple.cgColor
        ]
        
        // set gradient locations
        // default is nil mean liner
        gradientLayer.locations = [0,0.25,0.5]
        
        // set gradient start and end point
        // set gradient start and end points
        // start and end point range [0,1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
    }
    
    func addGradient(with index: Int, colors: [Any]?,startPoint: CGPoint,endPoint:CGPoint) {
        // create gradient layer and add it to containerView
        let gradientLayer = CAGradientLayer()
        let subView = containerView.subviews[index]
        gradientLayer.frame = subView.bounds
        subView.layer.addSublayer(gradientLayer)
        
        // set gradient color
        gradientLayer.colors = colors
        
        // set gradient start and end points
        // start and end point range [0,1]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
    }
}

