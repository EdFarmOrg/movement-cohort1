//
//  WalksViewController.swift
//  MovementCohort1
//
//  Created by Craig Clayton on 1/30/23.
//

import UIKit

class WalksViewController: UIViewController {

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

struct WalksViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIStoryboard(name: "Walks", bundle: nil).instantiateInitialViewController()!
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MagicWalksViewController_Preview: PreviewProvider {
    static var previews: some View {
        WalksViewControllerRepresentable()
    }
}
#endif
