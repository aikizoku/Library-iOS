import Foundation

extension String {
    
    /**
     ローカライズ文字列取得の短縮系
     
     "hello".localized
     →"こんにちわ"
     */
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
    
    func localized(withTableName tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: self)
    }
}
