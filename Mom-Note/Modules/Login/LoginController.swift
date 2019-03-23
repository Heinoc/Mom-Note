//
//  LoginController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/3/22.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class LoginController: UIViewController {
    
    var phoneLoginBtn: UIButton?
    var registerBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.initView()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    private func initView() {
        
        self.navigationController?.navigationBar.isHidden = true
        
        weak var wsSelf = self

        registerBtn = UIButton()
        self.view.addSubview(registerBtn!)
        registerBtn?.setTitle("没有账号？现在注册", for: UIControl.State.normal)
        registerBtn?.setTitleColor(UIColor(hex: "#007AFF"), for: UIControl.State.normal)
        registerBtn?.backgroundColor = UIColor.clear
        registerBtn?.addTarget(self, action: #selector(onBtnClick), for: UIControl.Event.touchUpInside)
        
        registerBtn?.snp.makeConstraints({ (maker) in
            maker.bottom.equalTo(wsSelf!.view).offset(-40)
            maker.left.equalTo(wsSelf!.view).offset(20)
            maker.right.equalTo(wsSelf!.view).offset(-20)
        })
        
        phoneLoginBtn = UIButton()
        self.view.addSubview(phoneLoginBtn!)
        phoneLoginBtn?.setTitle("手机号登录", for: UIControl.State.normal)
        phoneLoginBtn?.backgroundColor = UIColor(hex: "#FF2D55")
        phoneLoginBtn?.addTarget(self, action: #selector(onBtnClick), for: UIControl.Event.touchUpInside)
        
        phoneLoginBtn?.snp.makeConstraints({ (maker) in
            maker.bottom.equalTo(wsSelf!.registerBtn!.snp.top).offset(-20)
            maker.left.equalTo(wsSelf!.view).offset(20)
            maker.right.equalTo(wsSelf!.view).offset(-20)
            maker.height.equalTo(44)
        })

    }
    
    @objc func onBtnClick(sender: UIButton?) {
        switch sender {
        case registerBtn:
            let reginsterController = RegisterController()
            self.navigationController?.pushViewController(reginsterController, animated: true)
            break
            
        case phoneLoginBtn:
            let phoneLoginController = PhoneLoginController()
            self.navigationController?.pushViewController(phoneLoginController, animated: true)
            break
            
        default: break
            
        }

    }
    
    
}
