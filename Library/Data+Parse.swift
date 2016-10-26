import Foundation

extension Data {
    
    /**
     プッシュ通知のデバイストークン文字列を取得する
     
     deviceTokenData.toDeviceToken()
     */
    func toDeviceToken() -> String {
        var token = description
        token = token.replace(target: "<", with: "")
        token = token.replace(target: ">", with: "")
        token = token.replace(target: " ", with: "")
        return token
    }
}
