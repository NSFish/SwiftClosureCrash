//
//  DerivedCrash.swift
//  SwiftClosureCrash
//
//  Created by 乐星宇 on 2017/8/18.
//  Copyright © 2017年 FangCloud. All rights reserved.
//

import UIKit

class DerivedCrash: Crash<DummyObject> {
    
    override class func tryCrash(_ dummyInt: Int, with closure: ((DummyObject) -> Void)) {
        super.tryCrash(dummyInt, with: closure)
        
        print("Derived tryCrash")
        let obj = DummyObject.init()
        closure(obj)
    }
}
