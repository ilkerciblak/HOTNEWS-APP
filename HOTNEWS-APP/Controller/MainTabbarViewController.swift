//
//  ViewController.swift
//  HOTNEWS-APP
//
//  Created by İlker Cıblak on 1.06.2024.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbarPreferences()
        setViewControllers([homeVC, settingsVC], animated: true)
    }
    
    
    private func setTabbarPreferences(){
        tabBar.unselectedItemTintColor = .white
        tabBar.backgroundColor = ColorK.balticBlack
        tabBar.tintColor = ColorK.flashWhite
        tabBar.isTranslucent = false
    }
    
    private let homeVC: UINavigationController = {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "newspaper"), selectedImage: UIImage(systemName: "newspaper.fill"))
        
        return homeVC
    }()

    private let settingsVC: UINavigationController = {
        let vc = UINavigationController(rootViewController: SettingsViewController())
        vc.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), selectedImage: UIImage(systemName: "gear.circle.fill"))
        
        return vc
    }()

}

