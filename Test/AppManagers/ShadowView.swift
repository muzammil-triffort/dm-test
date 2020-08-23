//
//  ShadowView.swift
//  Test
//
//  Created by Muzammil Mohammad on 24/08/20.
//  Copyright © 2020 Digital Mind. All rights reserved.
//

import Foundation
import UIKit

class ButtonWithShadow: UIButton {

    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)

        self.layer.cornerRadius = self.frame.size.height / 2.0
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 9.0
    }
}

class ShadowView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.layer.cornerRadius = self.frame.size.height / 2.0
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowRadius = 9.0
    }
}

