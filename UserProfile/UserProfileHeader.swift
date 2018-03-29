//
//  UserProfileHeader.swift
//  InstagramV2
//
//  Created by Morphley on 28.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit
import Firebase


class UserProfileHeader: UICollectionViewCell{
    
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.red
        return iv
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.blue
    
        addSubview(profileImageView)
        
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        profileImageView.clipsToBounds = true
        
       // setupProfileImage()

    }
    
    var user: User? {
        didSet{
            
        setupProfileImage()
            
        }
    }
    
    
    fileprivate func setupProfileImage(){
        guard let profileImageUrl = user?.profileImageUrl else { return }
        
        guard  let url = URL(string: profileImageUrl) else{ return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // check for the error and construct the image using data
            
            if let err = err {
                
                print("Failed to fetch profile image : ", err)
                
            }
            guard let data = data else { return }
            let image = UIImage(data: data)
            
            //need to get back on the main ui thread
            DispatchQueue.main.async {
                self.profileImageView.image = image
            }
            
            }.resume()
        
  
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
