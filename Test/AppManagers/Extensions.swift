//
//  Extensions.swift
//  Test
//
//  Created by Muzammil Mohammad on 10/08/20.
//  Copyright © 2020 Digital Mind. All rights reserved.
//

import Foundation
import UIKit

extension UIFont
{
    struct AppFonts
    {
        static func UbuntuMedium(size: CGFloat) -> UIFont
        {
            return UIFont(name: "Ubuntu-Medium", size: size)!
        }
        static func UbuntuRegular(size: CGFloat) -> UIFont
        {
            return UIFont(name: "Ubuntu-Regular", size: size)!
        }
        static func UbuntuBold(size: CGFloat) -> UIFont
        {
            return UIFont(name: "Ubuntu-Bold", size: size)!
        }
    }
}
extension UITabBar {

    override public func sizeThatFits(_ size: CGSize) -> CGSize {
        
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        
        if self.safeAreaBottom > 0 {
            
            sizeThatFits.height = 80 + self.safeAreaBottom
        }
        else {
            sizeThatFits.height = 80
        }
         // or whatever height you need
        return sizeThatFits
   }
}

extension UIColor {
    
    struct AppColors
    {
        static let Gold    = UIColor(netHex: 0xB9A089)
        
        struct Gray {
            static let Medium   = UIColor(netHex: 0x8D8784)
            static let Dark     = UIColor(netHex: 0x4B4948)
            static let Light    = UIColor(netHex: 0xB7AFAB)
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

extension UIView {

    var safeAreaBottom: CGFloat {
         if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.bottom
            }
         }
         return 0
    }

    var safeAreaTop: CGFloat {
         if #available(iOS 11, *) {
            if let window = UIApplication.shared.keyWindowInConnectedScenes {
                return window.safeAreaInsets.top
            }
         }
         return 0
    }
}

extension UIApplication {
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}

extension UILabel
{
    func addImage(imageName: String, afterLabel bolAfterLabel: Bool = false)
    {
        let attachment: NSTextAttachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        let attachmentString: NSAttributedString = NSAttributedString(attachment: attachment)

        if (bolAfterLabel)
        {
            let strLabelText: NSMutableAttributedString = NSMutableAttributedString(string: self.text!)
            strLabelText.append(attachmentString)

            self.attributedText = strLabelText
        }
        else
        {
            let txt: String = "  " + self.text!
            let strLabelText: NSAttributedString = NSAttributedString(string: txt)
            let mutableAttachmentString: NSMutableAttributedString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)

            self.attributedText = mutableAttachmentString
        }
    }

    func removeImage()
    {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}

extension UIImage {
    
    static func from(color: UIColor) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
