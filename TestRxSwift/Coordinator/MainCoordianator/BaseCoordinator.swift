class BaseCoordinator : Coordinator {
    var childCoordinator: [Coordinator] = []
    
    func start() {
        fatalError(AppError.noCoordinators.localizedDescription)
    }
    
}

