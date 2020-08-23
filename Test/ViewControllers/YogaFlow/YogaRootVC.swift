//
//  YogaRootVC.swift
//  Test
//
//  Created by Muzammil Mohammad on 10/08/20.
//  Copyright © 2020 Digital Mind. All rights reserved.
//

import Foundation
import UIKit

class YogaRootVC: UIViewController, UITableViewDelegate, UITableViewDataSource, AnimatedHeaderDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var animatedHeader: AnimatedHeader!
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
                
        var tableFrame = self.tableView.frame
        
        if self.view.safeAreaTop > 0 {
            tableFrame.origin.y -= self.view.safeAreaTop
        }
        else {
            tableFrame.origin.y -= 20
        }
        self.tableView.frame = tableFrame
        
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension;
        self.tableView.estimatedRowHeight = 120
        
        self.animatedHeader = (Bundle.main.loadNibNamed("AnimatedHeader", owner: self, options: nil)?.first as? AnimatedHeader)!
        self.animatedHeader.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.animatedHeader.animateView()
    }
    
    func backSelected() {
        
        self.navigationController?.popViewController(animated: false)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if self.animatedHeader != nil {
            
            return self.animatedHeader
        }
        
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 440
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 120
        }
        
        if indexPath.row == 1 {
            return 110
        }
        
        if indexPath.row == 2 {
            return 170
        }
        
        if indexPath.row == 3 {
            return 70
        }
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
        
            let cell: YogaHeadingCell = tableView.dequeueReusableCell(withIdentifier: "YogaHeadingCell", for: indexPath) as! YogaHeadingCell
            
            cell.updateData(title: "Efficitur Resort Yoga center", description: "755 brickyard st., Lake Zurich, IL 60047")
            
            return cell
        }
        
        if indexPath.row == 1 {
        
            let cell: YogaTimeCell = tableView.dequeueReusableCell(withIdentifier: "YogaTimeCell", for: indexPath) as! YogaTimeCell
                        
            let data: Dictionary<String, Any> = ["weekdays": "09:00-18:00", "weekend": "08:30-17:30", "status": "Open now" ]
            
            cell.updateData(data: data)
            return cell
        }
        
        if indexPath.row == 2 {
            
            let cell: YogaSubtitleCell = tableView.dequeueReusableCell(withIdentifier: "YogaSubtitleCell", for: indexPath) as! YogaSubtitleCell
            
            let title: String = "Description"
            let subtitle: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
            
            cell.updateSubtitleData(title: title, subtitle: subtitle)
                    
            return cell
        }
        
        let cell: YogaReviewCell = tableView.dequeueReusableCell(withIdentifier: "YogaReviewCell", for: indexPath) as! YogaReviewCell
        return cell
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
}
