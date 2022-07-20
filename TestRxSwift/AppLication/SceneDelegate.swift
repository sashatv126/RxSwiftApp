import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        AppMainCoordinator(window: self.window!).start()
        
    }
}
