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
    
    var phoneTF: UITextField?
    var pwdTF: UITextField?
    
    var loginBtn: UIButton?

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
        
        let phoneLabel = UILabel()
        phoneLabel.text = "手机号 |"
        phoneLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(20)
            maker.top.equalToSuperview().offset(statusHeight + 20)
            maker.height.equalTo(48)
            maker.width.equalTo(65)
        }
        
        phoneTF = UITextField()
        phoneTF?.keyboardType = UIKeyboardType.phonePad
//        phoneTF?.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(phoneTF!)
        
        phoneTF?.snp.makeConstraints({ (maker) in
            maker.top.equalTo(phoneLabel)
            maker.left.equalTo(phoneLabel.snp.right).offset(10)
            maker.right.equalTo(weakSelf!.view).offset(-20)
            maker.height.equalTo(phoneLabel)
        })
        
        let divierLine = UIView()
        divierLine.backgroundColor = UIColor.black
        self.view.addSubview(divierLine)
        divierLine.snp.makeConstraints { (maker) in
            maker.top.equalTo(phoneLabel.snp.bottom)
            maker.left.equalTo(phoneLabel)
            maker.right.equalTo(weakSelf!.phoneTF!)
            maker.height.equalTo(0.5)
        }
        
        let pwdLabel = UILabel()
        pwdLabel.text = "密    码 |"
        pwdLabel.textAlignment = NSTextAlignment.right
        self.view.addSubview(pwdLabel)
        pwdLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(divierLine.snp.bottom)
            maker.left.equalTo(phoneLabel)
            maker.right.equalTo(phoneLabel)
            maker.height.equalTo(phoneLabel)
        }
        
        pwdTF = UITextField()
        pwdTF?.isSecureTextEntry = true
        self.view.addSubview(pwdTF!)
        
        pwdTF?.snp.makeConstraints({ (maker) in
            maker.top.equalTo(pwdLabel)
            maker.left.equalTo(weakSelf!.phoneTF!)
            maker.right.equalTo(weakSelf!.phoneTF!)
            maker.height.equalTo(weakSelf!.phoneTF!)
        })
        
        loginBtn = UIButton()
        loginBtn?.setTitle("登录", for: UIControl.State.normal)
        loginBtn?.backgroundColor = UIColor(hex: "#FF2D55")
        loginBtn?.addTarget(self, action: #selector(onBtnClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(weakSelf!.loginBtn!)
        
        loginBtn?.snp.makeConstraints({ (maker) in
            maker.top.equalTo(weakSelf!.pwdTF!.snp.bottom).offset(20)
            maker.left.equalTo(weakSelf!.view).offset(20)
            maker.right.equalTo(weakSelf!.view).offset(-20)
            maker.height.equalTo(44)
        })

    }
    
    @objc func onBtnClick(sender: UIButton?) {
        switch sender {
        case self.loginBtn:
            let phone = phoneTF?.text
            let pwd = pwdTF?.text
            
            self.login(phone: phone ?? "", pwd: pwd ?? "")
            break
        default:
            break
        }
    }
    
    private func login(phone: String, pwd: String) {
        ServerAPI.login(phone: phone, userName: "", password: pwd, onSuccess: { (response) in
            
            let user = response as! User
            
            let defaults = UserDefaults.standard
            defaults.set(user.userId, forKey: LoginInfo.userID)
            
            self.navigationController?.popToRootViewController(animated: true)
            
            let application = UIApplication.shared.delegate as! AppDelegate
            application.window?.rootViewController = application.customTabbar()
            
        }) { (errMsg) in
            self.view.makeToast(errMsg)
        }
    }

}
