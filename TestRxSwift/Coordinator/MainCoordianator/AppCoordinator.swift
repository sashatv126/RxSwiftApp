import UIKit

class AppMainCoordinator: BaseCoordinator {
    
    private let window : UIWindow
    
    private let presenter = UINavigationController()
    
    init(window : UIWindow) {
        self.window = window
    }

    override func start() {
        
        let mainCoordinator = MainCoordinator(presenter: presenter)
        self.add(coordinator: mainCoordinator)
        
        mainCoordinator.start()
        
        window.rootViewController = presenter
        window.makeKeyAndVisible()
    }
}
