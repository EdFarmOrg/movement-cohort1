import UIKit

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    private var tabBarController: UITabBarController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    convenience init() {
        self.init(navigationController: UINavigationController())
    }
}

extension MainCoordinator {
    func start() {
        showMainTabBarController()
    }
}

private extension MainCoordinator {
    func showMainTabBarController() {
        let mainTabBarController = MainTabBarController()
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .red
        mainTabBarController.tabBar.standardAppearance = appearance
        mainTabBarController.tabBar.clipsToBounds = false
        
        let homeCoordinator = HomeCoordinator(presenterController: mainTabBarController)
        
        homeCoordinator.viewController.tabBarItem.title = "Home"
        homeCoordinator.viewController.tabBarItem.image = UIImage(systemName: "home.fill")
        homeCoordinator.viewController.tabBarItem.selectedImage = UIImage(systemName: "house")
        
        let contributorsCoordinator = ContributorCoordinator(presenterController: mainTabBarController)
        
        contributorsCoordinator.viewController.tabBarItem.title = "Contributors"
        contributorsCoordinator.viewController.tabBarItem.image = UIImage(systemName: "person.2.corp.square.stack.fill")
        contributorsCoordinator.viewController.tabBarItem.selectedImage = UIImage(systemName: "person.2.corp.square.stack")
        
        let walksCoordinator = WalksCoordinator(presenterController: mainTabBarController)
        
        walksCoordinator.viewController.tabBarItem.title = "Walks"
        walksCoordinator.viewController.tabBarItem.image = UIImage(systemName: "figure.walk.diamond.fill")
        walksCoordinator.viewController.tabBarItem.selectedImage = UIImage(systemName: "figure.walk.diamond")
        
        homeCoordinator.start()
        contributorsCoordinator.start()
        walksCoordinator.start()

        appendChildCoordinator(homeCoordinator)
        appendChildCoordinator(contributorsCoordinator)
        appendChildCoordinator(walksCoordinator)
        
        mainTabBarController.viewControllers = [
            homeCoordinator.viewController,
            contributorsCoordinator.viewController,
            walksCoordinator.viewController
        ]
        
        tabBarController = mainTabBarController
        
        navigationController.pushViewController(mainTabBarController, animated: true)
        
    }
}
