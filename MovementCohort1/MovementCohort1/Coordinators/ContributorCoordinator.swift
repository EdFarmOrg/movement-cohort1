import UIKit

final class ContributorCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var viewController = ContributorsViewController.instantiate(name: .contributors)
    
    private weak var presenterController: UIViewController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init(presenterController: UIViewController?) {
        self.init(navigationController: UINavigationController())
        self.presenterController = presenterController
    }
    
//    convenience override init() {
//        self.init(navigationController: UINavigationController())
//    }
}
extension ContributorCoordinator {
    func start() {
    }
}
