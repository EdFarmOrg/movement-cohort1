import UIKit

final class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var viewController = HomeViewController.instantiate(name: .home)
    var section: HomeSection?
    var selectedItemIndex: Int = 0
    
    private weak var presenterController: UIViewController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init(presenterController: UIViewController?) {
        self.init(navigationController: UINavigationController())
        self.presenterController = presenterController
    }
}

extension HomeCoordinator {
    func start() {
        
    }
    
    func showDetails() {
        
        let detailVc = UIStoryboard(name: "HomeDetail", bundle: nil).instantiateViewController(withIdentifier: "HomeDetailViewController") as! HomeDetailViewController
        detailVc.selectedItemIndex = selectedItemIndex
        navigationController.pushViewController(detailVc, animated: true)
    }
}
