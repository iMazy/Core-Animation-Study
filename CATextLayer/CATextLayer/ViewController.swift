//
//  ViewController.swift
//  CATextLayer
//
//  Created by  Mazy on 2017/5/6.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit


/*
 CATextLayer是CALayer的子类，它以图层的形式包含了UILabel几乎所有的绘制特性，并且额外提供了一些新的特性。
 CATextLayer也要比UILabel渲染得快得多
 UILabel其实是通过WebKit来实现绘制的
 而CATextLayer使用了Core text，并且渲染得非常快
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化textLayer
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: 20, y: 50, width: view.bounds.width-40, height: 100)
        view.layer.addSublayer(textLayer)
        
        // 设置textLayer的属性
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = kCAAlignmentJustified
        textLayer.isWrapped = true
        
        // 设置字体
        let font = UIFont.systemFont(ofSize: 15)
        let fontName = font.fontName
        let fontRef = CGFont(fontName as CFString)
        textLayer.font = fontRef
        
        textLayer.fontSize = font.pointSize
        
        let text = "为什么原本亲密的关系会变淡？或许有人会说因为大家都忙'没时间联系'少见面…我在想~为什么没人敢坦诚的承认，是因为社会资源'地位'见识差距变大了。渐渐的你的苦闷他无法理解，他的彷徨在你而言是变相炫耀。两个人无话可说，只能叙旧，直到过去被反复咀嚼，淡而无味，又碍于情面怕被指责势利，还要勉强维持点赞的情分！许多曾经只能被拿来怀念，许多因恩面结的缘最后成了负担…我越来越觉得朋友是需要交换观点的，而不仅仅是交换感情的！能一直同路的人太少'所以珍惜每段路上的每个朋友，就算到了分岔口'温柔道别'谨记彼此的好！"
        
        // set layer text
        textLayer.string = text
        
        
        
        
        
    }


}

