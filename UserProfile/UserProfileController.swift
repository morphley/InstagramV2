//
//  UserProfileController.swift
//  InstagramV2
//
//  Created by Morphley on 27.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit
import Firebase


class UserProfileController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
        navigationItem.title = Auth.auth().currentUser?.uid
        fetchUser()
        collectionView?.register(UserProfileHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        setupLogoutButton()
        
    }
    
    fileprivate func setupLogoutButton(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLogout))
        
    }
    
    @objc func handleLogout(){
        
      let alertController = UIAlertController(title: "Logout", message: "Are you sure ?", preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
            print("Perform Logout")
            
        
            do {
                try Auth.auth().signOut()
                
                
                
            }catch let signOutErr {
                print("Failed to signout", signOutErr)
            }
           
            
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
            print("Perform Cancel")
        }))
        
        
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.purple
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // gives you either header or footer
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! UserProfileHeader
        
        header.user = self.user 
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    var user: User?
    // not accesible outside of the class
   fileprivate func fetchUser(){
    
    guard let uid = Auth.auth().currentUser?.uid else { return }
    
    Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
        
        print(snapshot.value ?? "")
        guard  let dictionary = snapshot.value as? [String : Any] else { return }
        
//        let profileImageUrl = dictionary["profileImageUrl"] as? String
//        let username = dictionary["username"] as? String
        
        self.user = User(dictionary: dictionary)
        self.navigationItem.title = self.user?.username
        self.collectionView?.reloadData()
        
    }) { (err) in
        print("Failed to fetch user :", err)
    }
    

    
    }
}



struct User {
    
    let username: String
    let profileImageUrl: String
    
    init(dictionary: [String: Any]) { // constructor
        
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
    }
}






