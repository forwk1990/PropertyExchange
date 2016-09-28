//
//  UIColor.swift
//  lujue
//
//  Created by itachi on 16/8/4.
//  Copyright © 2016年 com.bj-evetime. All rights reserved.
//


extension UIColor
{
    public class func colorWithHex(hex:Int,alpha:CGFloat) -> UIColor{
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public class func colorWithHex(hex:Int) -> UIColor{
        return self.colorWithHex(hex: hex, alpha: 1.0)
    }
    
    public class func randowmColor(alpha:CGFloat) -> UIColor{
        let r = CGFloat((arc4random() % 1))
        let g = CGFloat((arc4random() % 1))
        let b = CGFloat((arc4random() % 1))
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}
