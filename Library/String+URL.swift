import Foundation

extension String {
    
    /**
     文字列をURLに変換する
     
     "http://thehero.jp".url
     */
    var url: URL? {
        return URL(string: self)
    }

    /**
     文字列をURLエンコードする
     失敗したら元の文字列を返す
     
     "http://thehero.jp?key=value".urlEncode()
     →"http%3A%2F%2Fthehero.jp%3Fkey%3Dvalue"
     */
    var urlEncode: String {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
    /**
     文字列をURLデコードする
     失敗したら元の文字列を返す
     
     "http%3A%2F%2Fthehero.jp%3Fkey%3Dvalue".urlDecode()
     →"http://thehero.jp?key=value"
     */
    var urlDecode: String {
        return removingPercentEncoding ?? self
    }
}
