//
//  AnimatedHeader.swift
//  Test
//
//  Created by Muzammil Mohammad on 23/08/20.
//  Copyright © 2020 Digital Mind. All rights reserved.
//

import Foundation
import UIKit

protocol AnimatedHeaderDelegate {
    
    func backSelected()
}

class AnimatedHeader: UIView  {
    
    var delegate: AnimatedHeaderDelegate?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    var imageOriginalHeight: CGFloat = 0.0
    
    override func awakeFromNib() {
        
        self.ratingLabel?.font = UIFont.AppFonts.UbuntuRegular(size: 15)
        self.ratingLabel?.textColor = UIColor.AppColors.Gray.Medium
        
        self.rating?.font = UIFont.AppFonts.UbuntuRegular(size: 15)
        self.rating?.textColor = UIColor.AppColors.Gold
        
        self.setupView()
    }
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
    }

    @objc func backPressed() {
        
        if self.delegate != nil {
            self.delegate?.backSelected()
        }
    }
    
    func setupView () {
                
        self.backButton.addTarget(self, action: #selector(self.backPressed), for: .touchUpInside)
        
        let gradient = CAGradientLayer()
        let black: UIColor = UIColor.init(white: 0, alpha: 0.4)
        gradient.frame = self.backView.bounds
        gradient.colors = [black.cgColor, UIColor.clear.cgColor]
        self.backView.layer.insertSublayer(gradient, at: 0)
        
        self.ratingView.layer.cornerRadius = self.ratingView.frame.size.height / 2.0
        self.ratingView.layer.shadowColor = UIColor.lightGray.cgColor
        self.ratingView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.ratingView.layer.shadowOpacity = 0.25
        self.ratingView.layer.shadowRadius = 10
        
        var imageFrame = self.topImageView.frame
        self.imageOriginalHeight = imageFrame.size.height
        imageFrame.size.width = self.frame.size.width
        imageFrame.origin.y -= 50
        imageFrame.size.height = 150
        self.topImageView.frame = imageFrame
        self.topImageView.layer.cornerRadius = 50

        self.topImageView.alpha = 1.0
        var rateFrame = self.ratingView.frame
        rateFrame.origin.x = self.frame.size.width / 2.0 - 60
        rateFrame.size.width = 120
        self.ratingView.frame = rateFrame
    }
    
    func animateView () {
        
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .beginFromCurrentState, animations: {

            self.ratingView.frame.origin.x = 50
            self.ratingView.frame.size.width = self.frame.size.width - 100
            self.topImageView.frame.size.height = self.imageOriginalHeight
            self.topImageView.frame.origin.y = 0
            self.topImageView.layer.cornerRadius = 0
            self.topImageView.alpha = 1.0
            
            let bound: CGRect = self.topImageView.bounds
            let path = UIBezierPath(roundedRect:bound,
                                            byRoundingCorners:[.bottomLeft, .bottomRight],
                                            cornerRadii: CGSize(width: 50, height:  50))
            
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            
            self.topImageView.layer.mask = mask;
            
            self.layoutIfNeeded()

        }) { (Bool) in

        }
    }

}
