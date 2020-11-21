//
//  LayerLabel.swift
//  CATextLayer
//
//  Created by  Mazy on 2017/5/7.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class LayerLabel: UILabel {

    override class var layerClass: AnyClass {
        get {
            return CATextLayer.self
        }
    }
    
    var textLayer: CATextLayer {
        return self.layer as! CATextLayer
    }
    
    func setup() {
        
        textLayer.alignmentMode = CATextLayerAlignmentMode.justified
        
        textLayer.isWrapped = true
        layer.display()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override var text: String? {
        didSet {
            super.text = text
            textLayer.string = text
        }
    }
    
    override var textColor: UIColor! {
        didSet {
            super.textColor = textColor
            textLayer.foregroundColor = textColor.cgColor
        }
    }
    
    override var font: UIFont! {
        didSet {
            super.font = font
            // 设置字体
            let fontName = font.fontName
            let fontRef = CGFont(fontName as CFString)
            textLayer.font = fontRef
            // 字体大小
            textLayer.fontSize = font.pointSize
        }
    }
    
}
