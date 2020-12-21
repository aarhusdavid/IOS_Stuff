//
//  ColorObjects.swift
//  dAarhus_Project03
//
//  Created by David Aarhus on 11/6/20.
//  Copyright © 2020 David Aarhus. All rights reserved.
//

import Foundation
import UIKit

struct ColorManager: Codable
{
    static var colorCollection: [Color] = []
}

struct Color: Codable
{
    var red: Int = 255
    var green: Int = 255
    var blue: Int = 255
    var alpha: Int = 255
    
    func GetHex() -> String
    {
        return String(format: "%02lX%02lX%02lX%02lX",
                      self.red, self.green, self.blue, self.alpha)
    }
    
    func GetImage() -> UIImage
    {
        let redVal = CGFloat(self.red / 255)
        let blueVal = CGFloat(self.blue / 255)
        let greenVal = CGFloat(self.green / 255)
        let alphaVal = CGFloat(self.alpha / 255)

        let uiColor = UIColor(red: redVal, green: greenVal, blue: blueVal, alpha: alphaVal)
        
        return uiColor.imageWithColor(width: 20, height: 20)
    }

}

extension UIColor
{
    func imageWithColor(width: Int, height: Int) -> UIImage
    {
        let size = CGSize(width: width, height: height)
        
        return UIGraphicsImageRenderer(size: size).image
        {
           rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

