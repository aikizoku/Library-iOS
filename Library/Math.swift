import Foundation

class Math: NSObject {
    
    /**
     valueをminからmaxの範囲に収めた結果を返す
     
     Math.clampInt(value: 30, min: 10, max: 20)
     →20
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
     
     if Math.insideInt(value: 15, min: 10, max: 20) {
        NSLog("範囲内")
     }
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
     
     Math.randInt(min: 10, max: 20)
     →13
     */
    static func randInt(min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min + 1))) + min
    }
    
    static func randFloat(min: Float, max: Float) -> Float {
        return (Float(arc4random_uniform(UINT32_MAX)) / Float(UINT32_MAX)) * (max - min) + min
    }
    
    static func randDouble(min: Double, max: Double) -> Double {
        return (Double(arc4random_uniform(UINT32_MAX)) / Double(UINT32_MAX)) * (max - min) + min
    }
    
    /**
     ランダムな真偽値を返す
     
     if Math.randBool() {
        NSLog("1/2の確率でtrue")
     }
     */
    static func randBool() -> Bool {
        return self.randInt(min:0, max: 1) == 1
    }
    
    /**
     百分率でランダムな真偽値を返す
     
     if Math.randBool(percent: 80) {
        NSLog("80％の確率でtrue")
     }
     */
    static func randBool(percent: Int) -> Bool {
        return self.randInt(min:0, max: 99) < percent
    }
}
