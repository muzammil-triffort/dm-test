//
//  YogaCell.swift
//  Test
//
//  Created by Muzammil Mohammad on 23/08/20.
//  Copyright © 2020 Digital Mind. All rights reserved.
//

import Foundation
import UIKit

class YogaHeadingCell: UITableViewCell {
            
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    
    override func awakeFromNib()
    {
        self.selectionStyle = .none
                
        self.title?.font = UIFont.AppFonts.UbuntuBold(size: 21)
        self.title?.textColor = UIColor.AppColors.Gray.Dark
        self.title?.numberOfLines = 0
                
        self.subtitle?.font = UIFont.AppFonts.UbuntuRegular(size: 17)
        self.subtitle?.textColor = UIColor.AppColors.Gray.Light
        self.subtitle?.numberOfLines = 0
    }
    
    
    func updateData(title: String, description: String) {
        
        self.title?.text = title
        self.subtitle?.text = description
        self.subtitle?.addImage(imageName: "location", afterLabel: false)
    }
}

class YogaMapCell: UITableViewCell {
            
    override func awakeFromNib()
    {
        self.selectionStyle = .none
                
        self.textLabel?.font =  UIFont.AppFonts.UbuntuMedium(size: 17)
        self.textLabel?.textColor = UIColor.AppColors.Gold
        self.textLabel?.numberOfLines = 1
        self.textLabel?.textAlignment = .center
        self.textLabel?.text = NSLocalizedString("See on map", comment: "")
    }
}

class YogaTimeCell: UITableViewCell {
            
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var weekdaysLabel: UILabel!
    @IBOutlet weak var weekendLabel: UILabel!
    @IBOutlet weak var weekdays: UILabel!
    @IBOutlet weak var weekend: UILabel!
    
    override func awakeFromNib()
    {
        self.selectionStyle = .none
                
        self.weekdaysLabel?.font = UIFont.AppFonts.UbuntuMedium(size: 16)
        self.weekdaysLabel?.textColor = UIColor.AppColors.Gray.Dark
        self.weekdaysLabel.text = NSLocalizedString("Weekdays", comment: "")

        self.weekendLabel?.font = UIFont.AppFonts.UbuntuMedium(size: 16)
        self.weekendLabel?.textColor = UIColor.AppColors.Gray.Dark
        self.weekendLabel.text = NSLocalizedString("Weekend", comment: "")
        
        self.weekdays?.font = UIFont.AppFonts.UbuntuRegular(size: 15)
        self.weekdays?.textColor = UIColor.AppColors.Gray.Medium
        
        self.weekend?.font = UIFont.AppFonts.UbuntuRegular(size: 15)
        self.weekend?.textColor = UIColor.AppColors.Gray.Medium
        
        self.statusLabel?.font = UIFont.AppFonts.UbuntuBold(size: 22)
        self.statusLabel?.textColor = UIColor.AppColors.Gray.Medium

    }
    
    func updateData(data: Dictionary<String, Any>) {
        
        self.weekdays.text = (data["weekdays"] as! String)
        self.weekend.text = data["weekend"] as? String
        self.statusLabel.text = (data["status"] as! String)
        
    }
}

class YogaSubtitleCell: UITableViewCell {
            
    override func awakeFromNib()
    {
        self.selectionStyle = .none
        self.clipsToBounds = true
                
        self.textLabel?.font = UIFont.AppFonts.UbuntuMedium(size: 16)
        self.textLabel?.textColor = UIColor.AppColors.Gray.Dark
        self.textLabel?.numberOfLines = 0
                
        self.detailTextLabel?.font = UIFont.AppFonts.UbuntuRegular(size: 16)
        self.detailTextLabel?.textColor = UIColor.AppColors.Gray.Medium
        self.detailTextLabel?.numberOfLines = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var titleFrame = self.textLabel?.frame
        titleFrame?.origin.x = 20
        titleFrame?.size.width = self.frame.size.width - 40
        self.textLabel?.frame = titleFrame!
        
        var detailFrame = self.detailTextLabel?.frame
        detailFrame?.origin.x = 20
        detailFrame?.size.width = self.frame.size.width - 40
        self.detailTextLabel?.frame = detailFrame!
    }
    
    func updateSubtitleData(title: String, subtitle: String) {
        
        self.textLabel?.text = "\n" +  title + "\n"
        self.detailTextLabel?.text = subtitle + "\n"
    }
}

class YogaReviewCell: UITableViewCell {
            
    override func awakeFromNib()
    {
        self.selectionStyle = .none
                
    }
}
