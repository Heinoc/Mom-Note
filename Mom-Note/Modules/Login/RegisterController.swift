//
//  RegisterController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/3/22.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RegisterController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.initView()

    }
    
    private func initView() {
        self.title = "新用户注册"
        self.navigationController?.navigationBar.isHidden = false
    }

}
