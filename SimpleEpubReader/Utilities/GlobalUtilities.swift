import UIKit

var App: AppDelegate! {
    get {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate
    }
}
