//
//  MathUtil.swift
//  Library
//
//  Created by yukithehero on 2016/08/29.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation

class Math: NSObject {
    
    /**
     valueをminからmaxの範囲に収めた結果を返す
     */
    static func clampInt(value: Int, min: Int, max: Int) -> Int {
        return (value < min) ? min : ((max < value) ? max : value)
    }
    
    static func clampFloat(value: Float, min: Float, max: Float) -> Float {
        return (value < min) ? min : ((max < value) ? max : value)
    }
    
    static func clampDouble(value: Double, min: Double, max: Double) -> Double {
        return (value < min) ? min : ((max < value) ? max : value)
    }
    
    /**
     valueがminからmaxの範囲にあるかどうかを返す
     */
    static func insideInt(value: Int, min: Int, max: Int) -> Bool {
        return (min <= value) && (value <= max)
    }
    
    static func insideFloat(value: Float, min: Float, max: Float) -> Bool {
        return (min <= value) && (value <= max)
    }
    
    static func insideDouble(value: Double, min: Double, max: Double) -> Bool {
        return (min <= value) && (value <= max)
    }

    /**
     minからmaxの範囲で乱数を返す
     */
    static func randInt(min min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
    
    static func randFloat(min min: Float, max: Float) -> Float {
        return (Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX)) * (max - min) + min
    }
    
    static func randDouble(min min: Double, max: Double) -> Double {
        return (Double(arc4random_uniform(UINT32_MAX)) / Double(UINT32_MAX)) * (max - min) + min
    }
    
    /**
     ランダムな真偽値を返す
     */
    static func randBool() -> Bool {
        return self.randInt(min:0, max: 1) == 1
    }
    
    /**
     百分率でランダムな真偽値を返す
     */
    static func randBool(percent: Int) -> Bool {
        return self.randInt(min:0, max: 100) < percent
    }
}
