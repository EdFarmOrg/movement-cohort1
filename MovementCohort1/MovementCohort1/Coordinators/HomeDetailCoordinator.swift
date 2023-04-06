import UIKit

final class HomeDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var viewController = HomeDetailViewController.instantiate(name: .homeDetail)
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

extension HomeDetailCoordinator {
    func start() {
    }
}
