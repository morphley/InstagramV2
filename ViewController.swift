//
//  ViewController.swift
//  InstagramV2
//
//  Created by Morphley on 24.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //closure-block
    let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        // button.backgroundColor = .red
        button.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        return button
    }() // execute closure block
    
    // problems using frame when rotating device layout is not longer true solution autolayout
    
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()

    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.init(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    
    let signUpButton: UIButton = {
        
        let btn = UIButton(type: .system)
        btn.setTitle("Sign Up", for: .normal)
        btn.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        btn.layer.cornerRadius = 5
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.white, for: .normal)
        return btn
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(plusPhotoButton)
        view.addSubview(emailTextField)
  
                plusPhotoButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
                plusPhotoButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
                plusPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                plusPhotoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        setupInputFields()
 
    }
    
    
    
    
    fileprivate func setupInputFields(){
      
        
        let stackView =  UIStackView(arrangedSubviews: [emailTextField, usernameTextField, passwordTextField,signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        view.addSubview(stackView)
        
        
        
        stackView.topAnchor.constraint(equalTo: plusPhotoButton.bottomAnchor, constant: 20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

