//
//  ViewController.swift
//  CAEmitterLayer
//
//  Created by  Mazy on 2017/5/10.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit


enum CellDirection {
    case TopLeft
    case TopRight
    case BottomLeft
    case BottomRight
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        centerCells()
        
        createCell(with: .TopLeft)
        createCell(with: .TopRight)
        createCell(with: .BottomLeft)
        createCell(with: .BottomRight)
        
        
    }
    
    func centerCells() {
        let emitterLayer = CAEmitterLayer()
        // set frame
        emitterLayer.frame = containerView.bounds
        containerView.layer.addSublayer(emitterLayer)
        
        // config emitter
        emitterLayer.renderMode = CAEmitterLayerRenderMode.additive //
        //
        emitterLayer.emitterPosition = CGPoint(x: emitterLayer.bounds.width/2, y: emitterLayer.bounds.height/2)
        
        // create cell
        let cell = CAEmitterCell()
        // 如果是图片 必须是CIImage
        cell.contents = UIImage(named: "interaction-spark")?.cgImage
        // config cell
        cell.birthRate = 30 // 产生的数量
        cell.lifetime = 5.0 // 存活时间
        cell.color = UIColor(red: 1.0, green: 0.5, blue: 0.1, alpha: 1.0).cgColor // cell 的颜色
        cell.alphaSpeed = -0.4 // 透明度降低率
        cell.velocity = 50
        cell.velocityRange = 50
        cell.emissionRange = CGFloat(Double.pi * 2) // 出现范围
        
        emitterLayer.emitterCells = [cell] // 添加到leyer中
    }
    
    func createCell(with direction:CellDirection) {
        
        let emitterLayer = CAEmitterLayer()
        // set frame
//        emitterLayer.frame = rect
        view.layer.addSublayer(emitterLayer)
        
        // config emitter
        emitterLayer.renderMode = .additive
        // create cell
        let cell = CAEmitterCell()
        // 如果是图片 必须是CIImage
        cell.contents = UIImage(named: "interaction-spark")?.cgImage
        // config cell
        cell.birthRate = 30 // 产生的数量
        cell.lifetime = 5.0 // 存活时间
        cell.color = UIColor(red: 1.0, green: 0.5, blue: 0.1, alpha: 1.0).cgColor // cell 的颜色
        cell.alphaSpeed = -0.4 // 透明度降低率
        cell.velocity = 50
        cell.velocityRange = 50
        
        cell.emissionRange = CGFloat(Float.pi / 4) // 出现范围
        
        switch direction {
        case .TopLeft:
            emitterLayer.emitterPosition = CGPoint(x: 50, y: 50)
            cell.emissionLongitude = 1
        case .TopRight:
            emitterLayer.emitterPosition = CGPoint(x: view.bounds.width-50, y: 50)
            cell.emissionLongitude = 2
        case .BottomLeft:
            emitterLayer.emitterPosition = CGPoint(x: 50, y: view.bounds.height-50)
            cell.emissionLongitude = -1
        case .BottomRight:
            emitterLayer.emitterPosition = CGPoint(x: view.bounds.width-50, y: view.bounds.height-50)
            cell.emissionLongitude = -2
        }
        
        emitterLayer.emitterCells = [cell] // 添加到leyer中
    }


}

