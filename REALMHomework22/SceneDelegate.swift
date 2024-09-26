//
//  SceneDelegate.swift
//  REALMHomework22
//
//  Created by Айгерим on 19.09.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
                
                let window = UIWindow(windowScene: windowScene)
                let launchScreenViewController = LaunchScreenVC()
                
                window.rootViewController = launchScreenViewController
                
                window.makeKeyAndVisible()
                self.window = window
                self.window?.overrideUserInterfaceStyle = .light
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.showMainApp()
                }
            }
    //MARK: - Private
        
        private func showMainApp() {
            window?.rootViewController = createTabBarController()
        }
        
        private func createTabBarController() -> UITabBarController {
            let tabBarController = UITabBarController()
            
            DatabaseService.shared.tabBarController = tabBarController
            
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = .white
            
            setTabBarItemColors(appearance.stackedLayoutAppearance)
            setTabBarItemColors(appearance.inlineLayoutAppearance)
            setTabBarItemColors(appearance.compactInlineLayoutAppearance)
            
            setTabBarBadgeAppearance(appearance.stackedLayoutAppearance)
            setTabBarBadgeAppearance(appearance.inlineLayoutAppearance)
            setTabBarBadgeAppearance(appearance.compactInlineLayoutAppearance)
            
            tabBarController.tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                tabBarController.tabBar.scrollEdgeAppearance = appearance
            }
            tabBarController.tabBar.isTranslucent = false
            
            tabBarController.viewControllers = (0...2)
                .map { index in
                    let viewController: UIViewController
                    let imageName: String
                    let title: String
                    
                    switch index {
                    case 0:
                        viewController = LoadJokeVC()
                        imageName = "smiley.fill"
                        title = "New Joke"
                    case 1:
                        viewController = JokeListVC(category: nil, isTabBarSelected: true)
                        imageName = "list.bullet.circle"
                        title = "Jokes"
                    case 2:
                        viewController = JokeCategoriesVC()
                        imageName = "theatermasks.circle"
                        title = "Categories"
                    default:
                        fatalError("Invalid index")
                    }
                    
                    viewController.tabBarItem.image = UIImage(systemName: imageName)
                    viewController.title = title
                    
                    return UINavigationController(rootViewController: viewController)
                }
            return tabBarController
        }
        
        
        private func setTabBarItemColors(_ itemAppearance: UITabBarItemAppearance) {
            itemAppearance.normal.iconColor = .systemGray
            itemAppearance.normal.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                NSAttributedString.Key.paragraphStyle: NSParagraphStyle.default
            ]
            
            itemAppearance.selected.iconColor = .black
            itemAppearance.selected.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.paragraphStyle: NSParagraphStyle.default
            ]
            
        }
        
        private func setTabBarBadgeAppearance(_ itemAppearance: UITabBarItemAppearance) {
            itemAppearance.normal.badgeBackgroundColor = .systemRed
            itemAppearance.normal.badgeTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
        }
    }
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


