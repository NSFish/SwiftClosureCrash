//
//  ViewController.swift
//  SwiftClosureCrash
//
//  Created by 乐星宇 on 2017/8/18.
//  Copyright © 2017年 FangCloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DerivedCrash.tryCrash(1) { _ in
            print("Never reach here")
        }
    }
}

