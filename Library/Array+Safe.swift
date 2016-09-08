//
//  Array+Safe.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

extension Array {
    
    /**
     要素を文字列として取得し、ない場合は空文字を返す
     - parameter i: インデックス
     - returns: 取得した要素
     ```
     hoges.getString(0)
     ```
     */
    func getString(i: Int) -> String {
        return self.getString(i, defaultValue: "")
    }
    
    /**
     要素を文字列として取得し、ない場合は任意の文字列を返す
     - parameter i: インデックス
     - parameter defaultValue: 要素を取得できなかった場合の返り値
     - returns: 取得した要素
     ```
     hoges.getString(0, "ないよ")
     ```
     */
    func getString(i: Int, defaultValue: String) -> String {
        return self[i] as? String ?? defaultValue
    }
    
    /**
     要素を数値として取得し、ない場合は0を返す
     - parameter i: インデックス
     - returns: 取得した要素
     ```
     hoges.getInt(0)
     ```
     */
    func getInt(i: Int) -> Int {
        return getInt(i, defaultValue: 0)
    }
    
    /**
     要素を数値として取得し、ない場合は任意の数値を返す
     - parameter i: インデックス
     - returns: 取得した要素
     ```
     hoges.getInt(0, -1)
     ```
     */
    func getInt(i: Int, defaultValue: Int) -> Int {
        return self[i] as? Int ?? defaultValue
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getFloat(i: Float) -> Float {
        return getFloat(i, defaultValue: 0)
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getFloat(i: Float, defaultValue: Float) -> Float {
        return self[i] as? Float ?? defaultValue
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getDouble(i: Double) -> Double {
        return getDouble(i, defaultValue: 0)
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getDouble(i: Double, defaultValue: Double) -> Double {
        return self[i] as? Double ?? defaultValue
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getBool(i: Int) -> Bool {
        return self.getBool(i, defaultValue: false)
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getBool(i: Int, defaultValue: Bool) -> Bool {
        let element: Element? = self[i]
        if let element = element as? Int {
            return Bool(element)
        } else if let element = element as? String {
            if element == "1" {
                return true
            } else if (element == "true") {
                return true
            } else {
                return false
            }
        } else if let element = element as? Bool {
            return element
        } else {
            return defaultValue
        }
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getArray<AnyObject>(i: Int) -> Array<AnyObject> {
        return self.getArray(i, defaultValue: [])
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getArray<AnyObject>(i: Int, defaultValue: Array<AnyObject>) -> Array<AnyObject> {
        return self[i] as? Array<AnyObject> ?? defaultValue
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getDictionary<String, AnyObject>(i: Int) -> Dictionary<String, AnyObject> {
        return self.getDictionary(i, defaultValue: [:])
    }
    
    /**
     タイトル
     - parameter hoge: 引数説明
     - returns: 返り値説明
     ```
     example
     ```
     */
    func getDictionary<String, AnyObject>(i: Int, defaultValue: Dictionary<String, AnyObject>) -> Dictionary<String, AnyObject> {
        return self[i] as? Dictionary<String, AnyObject> ?? defaultValue
    }
}
