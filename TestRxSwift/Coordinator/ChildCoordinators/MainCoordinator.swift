import UIKit

class MainCoordinator : BaseCoordinator {
    
    private let presenter : UINavigationController?
    
    init(presenter : UINavigationController?) {
        self.presenter = presenter
    }
    
    override func start() {
        //set viewModelBuilder for first view
        let view = MainViewController()
        let viewModel = MainViewViewModel()
        view.viewModel = viewModel
        
        presenter?.pushViewController(view, animated: true)
    }
}
