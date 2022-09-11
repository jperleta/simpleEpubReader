import UIKit

class Localized {
    
    static let shared = Localized()
    
    private init() {}
    
    public static func string(key: String) -> String {
        return NSLocalizedString(key, tableName: nil, comment: "")
    }
}
