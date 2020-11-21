//
//  Duration_repeatController.swift
//  CAMediaTiming
//
//  Created by Mazy on 2017/5/17.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class Duration_repeatController: UIViewController {
    
    @IBOutlet weak var planeImageView: UIImageView!
    @IBOutlet weak var durationField: UITextField!
    
    @IBOutlet weak var repeatCountField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    var planeLayer = CALayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    func setControlEnabeled(enabled: Bool) {
        for control: UIControl in [durationField,repeatCountField,startButton] {
            control.isEnabled = enabled
            control.alpha = enabled ? 1.0 : 0.25
        }
    }
    
    func hideKeyboard() {
        durationField.resignFirstResponder()
        repeatCountField.resignFirstResponder()
    }
    
    @IBAction func startAnimation(_ sender: UIButton) {
    
        guard let durationStr = durationField.text,
            let repeatCountStr = repeatCountField.text,
            let duration = Double(durationStr),
            let repeatCount = Float(repeatCountStr) else {
                return
        }
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.rotation"
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.byValue = Double.pi * 2
        animation.delegate = self
        planeImageView.layer.add(animation, forKey: "rotateAnimation")
        setControlEnabeled(enabled: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    

}

extension Duration_repeatController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        setControlEnabeled(enabled: true)
    }
}
