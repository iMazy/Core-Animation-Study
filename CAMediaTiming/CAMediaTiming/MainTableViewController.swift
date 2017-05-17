//
//  MainTableViewController.swift
//  CAMediaTiming
//
//  Created by Mazy on 2017/5/17.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "fillMode" {
            let vc = segue.destination as! TimeOffsetViewController
            vc.title  = "FillMode"
            vc.isFillMode = true
        }
        
    }

}
