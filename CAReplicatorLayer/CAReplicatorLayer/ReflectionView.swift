//
//  ReflectionView.swift
//  CAReplicatorLayer
//
//  Created by  Mazy on 2017/5/9.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ReflectionView: UIView {

    override class var layerClass: AnyClass {
        get {
            return CAReplicatorLayer.self
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    func setup() {
    
        // config repliactor
        let newLayer = self.layer as! CAReplicatorLayer
        newLayer.instanceCount = 2
        
        var transform = CATransform3DIdentity
        let verticalOffset = bounds.size.height - 50
        transform = CATransform3DTranslate(transform, 0, verticalOffset, 0)
        transform = CATransform3DRotate(transform, CGFloat(Double.pi/2/3*2), 1, 0, 0)
        transform = CATransform3DScale(transform, 1, -1, 0)
        newLayer.instanceTransform = transform
        
        newLayer.instanceAlphaOffset = -0.6
        
    }

}
