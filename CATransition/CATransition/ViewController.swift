//
//  ViewController.swift
//  CATransition
//
//  Created by Mazy on 2017/5/16.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

/*
 CATransition
 
 CAAnimation的子类
 
 
 CATransition有一个type和subtype来标识变换效果。
     type属性是一个NSString类型，可以被设置成如下类型：
         TransitionFade
         kCATransitionMoveIn
         kCATransitionPush
         kCATransitionReveal
 
     后面三种过渡类型都有一个默认的动画方向，它们都从左侧滑入
     通过subtype来控制它们的方向
         kCATransitionFromRight
         kCATransitionFromLeft
         kCATransitionFromTop
         kCATransitionFromBottom
 
 
 */

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var styleControl: UISegmentedControl!
    
    @IBOutlet weak var subStyleControl: UISegmentedControl!
    
    var imageArray: [UIImage]?
    
    lazy var transition = CATransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image_meet = UIImage(named: "guide_meet"),
           let image_matched = UIImage(named: "guide_matched"),
           let image_like =  UIImage(named: "guide_liked") {
            
            imageView.image = image_meet
            
            imageArray = [image_like,image_meet,image_matched]
        }
        
        styleControl.addTarget(self, action: #selector(styleChange), for: .valueChanged)
        
        subStyleControl.addTarget(self, action: #selector(subStyleChange), for: .valueChanged)
        
    }
    
    func styleChange(segment: UISegmentedControl) {
        
        switch segment.selectedSegmentIndex {
        case 0:
            transition.type = kCATransitionFade
        case 1:
            transition.type = kCATransitionMoveIn
        case 2:
            transition.type = kCATransitionPush
        case 3:
            transition.type = kCATransitionReveal
        default:
            break
        }
    }
    
    func subStyleChange(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            transition.subtype = kCATransitionFromLeft
        case 1:
            transition.subtype = kCATransitionFromRight
        case 2:
            transition.subtype = kCATransitionFromTop
        case 3:
            transition.subtype = kCATransitionFromBottom
        default:
            break
        }
    }

    @IBAction func switchImage() {
//        let transition = CATransition()
        
//        transition.type = kCATransitionMoveIn
        imageView.layer.add(transition, forKey: nil)
        
        guard let currentImage = imageView.image,
        var index = imageArray?.index(of: currentImage)
        else { return }
        
        index = (index + 1) % (imageArray?.count ?? 1)
        
        imageView.image = imageArray?[index]
    }


}

