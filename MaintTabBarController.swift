//
//  MaintTabBarController.swift
//  InstagramV2
//
//  Created by Morphley on 27.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue
   
        let layout = UICollectionViewFlowLayout()
        let userProfileController = UserProfileController(collectionViewLayout: layout)

         let navController = UINavigationController(rootViewController: userProfileController)
        
        
    
        navController.tabBarItem.image = #imageLiteral(resourceName: "profile_unselected")
        navController.tabBarItem.selectedImage = #imageLiteral(resourceName: "profile_selected")
        tabBar.tintColor = .black
        
        viewControllers = [navController, UIViewController()]
        

    }
    
    
}
