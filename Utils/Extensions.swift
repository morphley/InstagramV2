//
//  Extensions.swift
//  InstagramV2
//
//  Created by Morphley on 26.03.18.
//  Copyright © 2018 Morphley. All rights reserved.
//

import UIKit


extension UIColor{
    
    // static is a class method 
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)

    }
    
    
}
