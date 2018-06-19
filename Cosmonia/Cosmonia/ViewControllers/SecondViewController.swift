//
//  SecondViewController.swift
//  Cosmonia
//
//  Created by Mac on 12.06.18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newLayer = CAGradientLayer()
        newLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        newLayer.frame = view.frame
        view.layer.addSublayer(newLayer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
