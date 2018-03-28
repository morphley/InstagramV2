//
//  UserProfileController.swift
//  InstagramV2
//
//  Created by Morphley on 27.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit
import Firebase


class UserProfileController: UICollectionViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.green
        
        navigationItem.title = Auth.auth().currentUser?.uid
        
        fetchUser()
        
    }
    
    // not accesible outside of the class
   fileprivate func fetchUser(){
    
    guard let uid = Auth.auth().currentUser?.uid else { return }
    
    Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
        
        print(snapshot.value ?? "")

        
        guard  let dictionary = snapshot.value as? [String : Any] else { return }
        let username = dictionary["username"] as? String 
        self.navigationItem.title = username
        
        
    }) { (err) in
        print("Failed to fetch user :", err)
    }
    
    
    
    
    
    }
}
