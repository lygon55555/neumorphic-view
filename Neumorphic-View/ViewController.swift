//
//  ViewController.swift
//  Neumorphic-View
//
//  Created by Yonghyun on 2020/09/23.
//  Copyright © 2020 Yonghyun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var neumorphicView: NeumorphicView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = neumorphicView.backgroundColor
    }
}
