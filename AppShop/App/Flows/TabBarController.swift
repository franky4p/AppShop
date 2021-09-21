//
//  TabBarController.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 21.09.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }
    

    func setupViewControllers() {
        viewControllers = [
            createNavigationController(for: ProductsTableViewController(), title: NSLocalizedString("Товары", comment: ""), image: UIImage(systemName: "house")),
            createNavigationController(for: UserDataViewController(), title: NSLocalizedString("Пользователь", comment: ""), image: UIImage(systemName: "person")),
            //createNavigationController(for: UserViewController(), title: NSLocalizedString("Vot", comment: ""), image: UIImage(systemName: "house")),
        ]
    }
    
    fileprivate func createNavigationController(for rootViewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
