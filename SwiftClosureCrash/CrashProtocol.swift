//
//  CrashProtocol.swift
//  SwiftClosureCrash
//
//  Created by 乐星宇 on 2017/8/18.
//  Copyright © 2017年 FangCloud. All rights reserved.
//

import Foundation

protocol CrashProtocol {
    associatedtype T
    
    static func tryCrash(_ dummyInt: Int,
                         with closure: ((T) -> Void))
}

class Crash<M>: CrashProtocol {
    typealias T = M
    
    class func tryCrash(_ dummyInt: Int,
                        with closure: ((M) -> Void)) {
        print("Crash tryCrash")
    }
}
