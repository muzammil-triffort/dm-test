//
//  TabVC.swift
//  Test
//
//  Created by Muzammil Mohammad on 10/08/20.
//  Copyright © 2020 Digital Mind. All rights reserved.
//

import Foundation
import UIKit

public let ScreenWidth  = UIScreen.main.bounds.width
public let ScreenHeight = UIScreen.main.bounds.height

var kBarHeight: CGFloat     = 78;
let kCornerRadius: CGFloat  = 40;

class TabVC: UITabBarController {
    
    override func viewWillLayoutSubviews() {
        
        let path = UIBezierPath(roundedRect:tabBar.bounds,
                                byRoundingCorners:[.topLeft, .topRight],
                                cornerRadii: CGSize(width: kCornerRadius, height:  kCornerRadius))

        let maskLayer = CAShapeLayer()
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.path = path.cgPath
        tabBar.layer.mask = maskLayer
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        kBarHeight = 78 + self.tabBar.safeAreaBottom
        
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
                
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Ubuntu-Medium", size: 14)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        
        let normalColor: UIColor = UIColor(red: 0.73, green: 0.63, blue: 0.54, alpha: 1.00)
        let selectedColor: UIColor = UIColor(red: 0.29, green: 0.29, blue: 0.28, alpha: 1.00)

        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name:"Ubuntu", size:12)!,
             NSAttributedString.Key.foregroundColor: normalColor],
            for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont(name:"Ubuntu", size:12)!,
             NSAttributedString.Key.foregroundColor: selectedColor],
            for: .selected)
        
        self.tabBar.tintColor = normalColor
        self.tabBar.unselectedItemTintColor = selectedColor
        
        tabBar.backgroundColor = .white
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        
        var frame: CGRect = tabBar.frame
        frame.origin.y = view.frame.height - kBarHeight
        frame.size.height = kBarHeight

        let tabbarBackgroundView = RoundShadowView(frame: tabBar.frame)
        tabbarBackgroundView.cornerRadius = kCornerRadius
        tabbarBackgroundView.backgroundColor = .white
        tabbarBackgroundView.frame = frame

        view.addSubview(tabbarBackgroundView)
        view.bringSubviewToFront(tabBar)
    }
}

class RoundShadowView: UIView {

    let containerView = UIView()
    var cornerRadius: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layoutView() {

        self.isOpaque = false
        
        containerView.layer.masksToBounds = true

        let bound: CGRect = self.bounds
        let path = UIBezierPath(roundedRect:bound,
                                byRoundingCorners:[.topLeft, .topRight],
                                cornerRadii: CGSize(width: kCornerRadius, height:  kCornerRadius))

        let shadowLayer = CAShapeLayer()
        shadowLayer.backgroundColor = UIColor.clear.cgColor
        shadowLayer.path = path.cgPath
        shadowLayer.shadowColor = UIColor.darkGray.cgColor
        shadowLayer.shadowOffset = CGSize(width: 0, height: -3.0)
        shadowLayer.shadowOpacity = 0.3
        shadowLayer.shadowRadius = 10.0
        
        self.layer.insertSublayer(shadowLayer, at: 0)
        
        //self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
