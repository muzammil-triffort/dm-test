//
//  StartView.swift
//  Test
//
//  Created by Muzammil Mohammad on 23/08/20.
//  Copyright © 2020 Digital Mind. All rights reserved.
//

import Foundation
import UIKit

protocol StartViewDelegate {
    func startSelected()
}

class StartVC: UIViewController {

    var delegate: StartViewDelegate?
    
    @IBOutlet weak var startButton: ButtonWithShadow!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.startButton.titleLabel?.font = UIFont.AppFonts.UbuntuMedium(size: 20)
        self.startButton.setTitleColor(.white, for: .normal)
        self.startButton.backgroundColor = UIColor.AppColors.Gold
    }
    
    @IBAction func startAction() {
        
        let vc = UIStoryboard.init(name : "Main" , bundle: Bundle.main).instantiateViewController(withIdentifier: "TabVC")as? TabVC
        
        self.navigationController?.pushViewController(vc!, animated: false)
    }
}
