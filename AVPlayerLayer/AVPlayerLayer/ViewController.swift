//
//  ViewController.swift
//  AVPlayerLayer
//
//  Created by  Mazy on 2017/5/10.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    var xmPlayer: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 获取视频url
        guard let url = Bundle.main.url(forResource: "demo", withExtension: "mp4") else {
            return
        }
        // 初始化播放器
        let player = AVPlayer(url: url)
        xmPlayer = player
        // 初始化播放器layer
        let playerLayer = AVPlayerLayer(player: player)
        // 设置播放器layer大小
        playerLayer.frame = containerView.bounds
        // 添加到视图中
        containerView.layer.addSublayer(playerLayer)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/800
        transform = CATransform3DRotate(transform, CGFloat(M_PI_4), 1, 1, 0)
        playerLayer.transform = transform
        
        playerLayer.masksToBounds = true
        playerLayer.cornerRadius = 30
        playerLayer.borderColor = UIColor.red.cgColor
        playerLayer.borderWidth = 3
        
        
    }
    
    func simplePlayer() {
        // 获取视频url
        guard let url = Bundle.main.url(forResource: "demo", withExtension: "mp4") else {
            return
        }
        // 初始化播放器
        let player = AVPlayer(url: url)
        // 初始化播放器layer
        let playerLayer = AVPlayerLayer(player: player)
        // 设置播放器layer大小
        playerLayer.frame = containerView.bounds
        // 添加到视图中
        containerView.layer.addSublayer(playerLayer)
        //   开始播放
        player.play()
    }
    
    @IBAction func playAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            xmPlayer?.play()
            sender.setTitle("pause", for: .normal)
        } else {
            xmPlayer?.pause()
            sender.setTitle("continue", for: .normal)
        }
    }


}

