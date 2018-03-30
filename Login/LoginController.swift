//
//  LoginController.swift
//  InstagramV2
//
//  Created by Morphley on 29.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit
import Firebase


class LoginController: UIViewController {
    
    
    let signUpButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Dont have an account ? Sign Up. ", for: .normal)
        btn.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return btn
    }()
    
    
    @objc func handleShowSignUp(){
        
        let signUpController  = SignUpController()
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.isNavigationBarHidden = true
        
        view.addSubview(signUpButton)
        
        signUpButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 2, paddingRight: 0, width: 0, height: 50)
        
    }
}
