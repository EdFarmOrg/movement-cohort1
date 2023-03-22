import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(name: UIStoryboard.Storyboard) -> Self
    
    func start()
}

extension UIStoryboard {
    enum Storyboard: String {
        case login = "Login"
        case createAccount = "Create Account"
        case home = "Home"
        case walks = "Walks"
        case stories = "Stories"
        case contributors = "Contributors"
    
        var id: String {
            return rawValue
        }
    }
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(name: UIStoryboard.Storyboard) -> Self {
        let full = NSStringFromClass(self)
        
        let storyboard = UIStoryboard(name: name.id, bundle: nil)
        let className = full.components(separatedBy: ".")[1]
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
