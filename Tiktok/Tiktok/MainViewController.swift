//
//  MainViewController.swift
//  Tiktok
//
//  Created by Aurelio Le Clarke on 26.03.2022.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let vc1  = UINavigationController(rootViewController: ViewController())
                let vc2 = UINavigationController(rootViewController: InterestingViewController())
                let vc3 = UINavigationController(rootViewController: AddNewViewController())
                let vc4 = UINavigationController(rootViewController: IncomingMessagesViewController())
        let vc5 = UINavigationController(rootViewController:ProfileViewController())
            
                vc1.tabBarItem.image = UIImage(systemName: "house")
                vc2.tabBarItem.image = UIImage(systemName: "safari")
                vc3.tabBarItem.image = UIImage(systemName: "plus.rectangle.fill")
                vc4.tabBarItem.image = UIImage(systemName: "mail.stack")
        vc5.tabBarItem.image = UIImage(systemName: "person")
                
                
                vc1.title = "Main"
                vc2.title = "Interesting"
                vc3.title = "Add"
                vc4.title = "Messages"
                vc5.title = "Profile"
                
        
                
        tabBar.tintColor = .label
                
                
                
                setViewControllers([vc1,vc2,vc3,vc4,vc5], animated: false)
    }
    


}
