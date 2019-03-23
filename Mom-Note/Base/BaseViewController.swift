//
//  BaseViewController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/2.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let defaults = UserDefaults.standard
        let userID = defaults.string(forKey: LoginInfo.userID)
        
        if userID == nil || userID == "" {
            let loginController = LoginController()
            
            self.present(loginController, animated: true) {
                
            }

        }

    }
    
}
