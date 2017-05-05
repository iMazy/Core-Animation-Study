//
//  ViewController.swift
//  CAShapeLayer
//
//  Created by  Mazy on 2017/5/5.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewA: UIView!
    
    @IBOutlet weak var viewB: UIView!
    
    @IBOutlet weak var viewC: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawA()
        drawB()
        drawC()
    }
    
    func drawA() {
        
        let path = UIBezierPath()
        let width = viewA.bounds.width
        
        path.addArc(withCenter: viewA.center, radius: viewA.bounds.width/2-10, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        
        path.move(to: CGPoint(x: 25, y: 35))
        path.addArc(withCenter: CGPoint(x:33,y:38), radius: 8, startAngle: CGFloat(-M_PI), endAngle: CGFloat(M_PI), clockwise: true)
        
        path.move(to: CGPoint(x: width-25, y: 35))
        path.addArc(withCenter: CGPoint(x:width-33,y:38), radius: 8, startAngle: 0, endAngle: CGFloat(M_PI*2), clockwise: true)
        
        path.move(to: CGPoint(x: 28, y: width-28))
        path.addArc(withCenter: viewA.center, radius: viewA.bounds.width/2-10-10, startAngle: CGFloat(-M_PI_4*5), endAngle: CGFloat(M_PI_4), clockwise: false)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = path.cgPath

        viewA.layer.addSublayer(shapeLayer)
        
    }
    
    func drawB() {
        
        let path = UIBezierPath()
        let width = viewB.bounds.width
        path.move(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: width-10, y: width-10))
        
        path.move(to: CGPoint(x: width-10, y: 10))
        path.addLine(to: CGPoint(x: 10, y: width-10))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = path.cgPath
        
        viewB.layer.addSublayer(shapeLayer)
        
    }

    func drawC() {
        
        let path = UIBezierPath()
        let width = viewC.bounds.width
        path.move(to: CGPoint(x: width/2, y: 10))
        path.addLine(to: CGPoint(x: 10, y: width-10))
        path.addLine(to: CGPoint(x: width-10, y: width-10))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.path = path.cgPath
        
        viewC.layer.addSublayer(shapeLayer)
        
    }

}

