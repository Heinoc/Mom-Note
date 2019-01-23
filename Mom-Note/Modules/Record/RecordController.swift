//
//  RecordController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/2.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import UIKit
import SnapKit

class RecordController: BaseViewController {
    
    var date: Date?
    
    var dateLabel: UILabel?
    var weightLabel: UILabel?
    var weightTF: UITextField?
    var waistlineLabel: UILabel?
    var waistlineTF: UITextField?
    var hiplineLabel: UILabel?
    var hiplineTF: UITextField?
    var thighlineLabel: UILabel?
    var thighlineTF: UITextField?
    
    var saveBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()

    }
    
    private func initView() {
        weak var weakSelf = self
        let statusHeight = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        
        dateLabel = UILabel()
        self.view.addSubview(dateLabel!)
        dateLabel?.snp.makeConstraints{(maker) -> Void in
            maker.left.equalTo(weakSelf!.view).offset(10)
            maker.top.equalTo(weakSelf!.view).offset(statusHeight + 10)

        }
        dateLabel?.text = self.date?.description
        
        // 体重
        weightLabel = UILabel()
        self.view.addSubview(weightLabel!)
        weightLabel?.text = "体重："
        weightLabel?.textAlignment = NSTextAlignment.right
        weightLabel?.snp.makeConstraints{ (maker) -> Void in
            maker.top.equalTo(weakSelf!.dateLabel!.snp.bottom).offset(50)
            maker.left.equalTo(weakSelf!.dateLabel!.snp.left)
            maker.width.equalTo(100)
        }
        weightTF = UITextField()
        weightTF?.keyboardType = UIKeyboardType.numberPad
        weightTF?.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(weightTF!)
        weightTF?.snp.makeConstraints{ (maker) -> Void in
            maker.centerY.equalTo(weakSelf!.weightLabel!)
            maker.left.equalTo(weakSelf!.weightLabel!.snp.right).offset(5)
            maker.right.equalTo(weakSelf!.view).offset(-50)
        }
        
        // 腰围
        waistlineLabel = UILabel()
        self.view.addSubview(waistlineLabel!)
        waistlineLabel?.text = "腰围："
        waistlineLabel?.textAlignment = NSTextAlignment.right
        waistlineLabel?.snp.makeConstraints{ (maker) -> Void in
            maker.top.equalTo(weakSelf!.weightLabel!.snp.bottom).offset(15)
            maker.left.equalTo(weakSelf!.weightLabel!.snp.left)
            maker.width.equalTo(weakSelf!.weightLabel!.snp.width)
        }
        waistlineTF = UITextField()
        waistlineTF?.keyboardType = UIKeyboardType.numberPad
        waistlineTF?.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(waistlineTF!)
        waistlineTF?.snp.makeConstraints{ (maker) -> Void in
            maker.centerY.equalTo(weakSelf!.waistlineLabel!)
            maker.left.equalTo(weakSelf!.weightTF!.snp.left)
            maker.width.equalTo(weakSelf!.weightTF!.snp.width)
        }
        
        // 臀围
        hiplineLabel = UILabel()
        self.view.addSubview(hiplineLabel!)
        hiplineLabel?.text = "臀围："
        hiplineLabel?.textAlignment = NSTextAlignment.right
        hiplineLabel?.snp.makeConstraints{ (maker) -> Void in
            maker.top.equalTo(weakSelf!.waistlineLabel!.snp.bottom).offset(15)
            maker.left.equalTo(weakSelf!.waistlineLabel!.snp.left)
            maker.width.equalTo(weakSelf!.waistlineLabel!.snp.width)
        }
        hiplineTF = UITextField()
        hiplineTF?.keyboardType = UIKeyboardType.numberPad
        hiplineTF?.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(hiplineTF!)
        hiplineTF?.snp.makeConstraints{ (maker) -> Void in
            maker.centerY.equalTo(weakSelf!.hiplineLabel!)
            maker.left.equalTo(weakSelf!.waistlineTF!.snp.left)
            maker.width.equalTo(weakSelf!.waistlineTF!.snp.width)
        }
        
        // 大腿围
        thighlineLabel = UILabel()
        self.view.addSubview(thighlineLabel!)
        thighlineLabel?.text = "大腿围："
        thighlineLabel?.textAlignment = NSTextAlignment.right
        thighlineLabel?.snp.makeConstraints{ (maker) -> Void in
            maker.top.equalTo(weakSelf!.hiplineLabel!.snp.bottom).offset(15)
            maker.left.equalTo(weakSelf!.hiplineLabel!.snp.left)
            maker.width.equalTo(weakSelf!.hiplineLabel!.snp.width)
        }
        thighlineTF = UITextField()
        thighlineTF?.keyboardType = UIKeyboardType.numberPad
        thighlineTF?.borderStyle = UITextField.BorderStyle.roundedRect
        self.view.addSubview(thighlineTF!)
        thighlineTF?.snp.makeConstraints{ (maker) -> Void in
            maker.centerY.equalTo(weakSelf!.thighlineLabel!)
            maker.left.equalTo(weakSelf!.hiplineTF!.snp.left)
            maker.width.equalTo(weakSelf!.hiplineTF!.snp.width)
        }
        
        // 保存按钮
        saveBtn = UIButton()
        saveBtn?.setTitle("记录", for: UIControl.State.normal)
        self.view.addSubview(saveBtn!)
        saveBtn?.snp.makeConstraints{ (maker) -> Void in
            maker.top.equalTo(weakSelf!.thighlineLabel!.snp.bottom).offset(20)
            maker.centerX.equalTo(weakSelf!.view)
            maker.width.equalTo(100)
        }
        saveBtn?.backgroundColor = UIColor(hex: "#FF2D55")
        saveBtn?.addTarget(self, action: #selector(onBtnClick), for: UIControl.Event.touchUpInside)
        
    }
    
    @objc func onBtnClick(sender: UIButton?) {
        switch sender {
        case saveBtn:
            weightTF?.text = ""
            waistlineTF?.text = ""
            hiplineTF?.text = ""
            thighlineTF?.text = ""
            
            
            ServerAPI.addRecord(userID: "1", weight: "2", waistline: "3") { (response) in
                
            }


        default:
            break
        }
    }

}
