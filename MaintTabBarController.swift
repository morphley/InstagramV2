//
//  MaintTabBarController.swift
//  InstagramV2
//
//  Created by Morphley on 27.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show LoginController if not logged in
        
        //wait until maintabbar controller is inside the ui then we present it
        
        
        if Auth.auth().currentUser == nil {
            //show if not logged in
            DispatchQueue.main.async {
                let loginController = LoginController()
                let navController = UINavigationController(rootViewController: loginController)
                self.present(navController, animated: true, completion: nil)
            }
            
            return
        }
        
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
