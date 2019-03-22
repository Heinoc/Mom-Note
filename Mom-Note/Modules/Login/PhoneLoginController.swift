//
//  PhoneLoginController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/3/22.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class PhoneLoginController: UIViewController {
    
    var phoneTF: UnderlineTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.initView()

    }
    
    private func initView() {
        
        weak var weakSelf = self
        let statusHeight = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        
        self.navigationController?.navigationBar.isHidden = false
        self.title = "手机号登录"
        
        phoneTF = UnderlineTextField()
        phoneTF?.keyboardType = UIKeyboardType.phonePad
//        phoneTF?.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(phoneTF!)
        
        phoneTF?.snp.makeConstraints({ (maker) in
            maker.top.equalTo(weakSelf!.view).offset(statusHeight + 20)
            maker.left.equalTo(weakSelf!.view).offset(20)
            maker.right.equalTo(weakSelf!.view).offset(-20)
        })

    }

}
