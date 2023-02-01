//
//  LoginViewController.swift
//  MovementCohort1
//
//  Created by Craig Clayton on 1/30/23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoginViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()!
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct LoginViewController_Preview: PreviewProvider {
    static var previews: some View {
        LoginViewControllerRepresentable()
    }
}
#endif
