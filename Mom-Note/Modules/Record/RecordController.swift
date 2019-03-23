//
//  RecordController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/2.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import UIKit
import SnapKit

import Toast_Swift

class RecordController: BaseViewController {
    
    var date: Date?
    
    var tableView: UITableView!
    
    var items: [HistoryType] = []
    
    let saveButtonTag = 0x00001
    
    override func loadView() {
        super.loadView()
        
        initView()
        
    }
    
    private func initView() {
        weak var weakSelf = self
        let statusHeight = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.view)
            maker.bottom.equalTo(weakSelf!.view)
            maker.left.equalTo(weakSelf!.view)
            maker.right.equalTo(weakSelf!.view)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(TextFieldTableCell.self, forCellReuseIdentifier: "TextFieldTableCell")
        self.tableView.register(SingleButtonTableCell.self, forCellReuseIdentifier: "SingleButtonTableCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        loadData()
        
    }
    
    func loadData() {
        
        items = []
        
        items.append(HistoryType(icon: "", title: "体重", type: Record.RecordType.WEIGHT))
        items.append(HistoryType(icon: "", title: "臂围", type: Record.RecordType.ARM_LINE))
        items.append(HistoryType(icon: "", title: "腰围", type: Record.RecordType.WAIST_LINE))
        items.append(HistoryType(icon: "", title: "胸围", type: Record.RecordType.BUST))
        items.append(HistoryType(icon: "", title: "臀围", type: Record.RecordType.HIP_LINE))
        items.append(HistoryType(icon: "", title: "大腿围", type: Record.RecordType.THIGH_LINE))
        
    }
    
    @objc func onBtnClick(sender: UIButton?) {
        switch sender?.tag {
        case saveButtonTag:
            print("haha")
            var record = Record()
//            record.weight = weightTF?.text ?? ""
//            record.armline = armlineTF?.text ?? ""
//            record.waistline = waistlineTF?.text ?? ""
//            record.bust = bustTF?.text ?? ""
//            record.hipline = hiplineTF?.text ?? ""
//            record.thighline = thighlineTF?.text ?? ""
//
//            ServerAPI.addRecord(userID: "bhtrgormvbapu6it7880",
//                                record: record,
//                                onSuccess: { (response) in
//
//                                    self.view.makeToast("记录添加成功！")
//
//                                    self.weightTF?.text = ""
//                                    self.armlineTF?.text = ""
//                                    self.waistlineTF?.text = ""
//                                    self.bustTF?.text = ""
//                                    self.hiplineTF?.text = ""
//                                    self.thighlineTF?.text = ""
//
//            },
//                                onFail: { (errMsg) in
//                                    self.view.makeToast(errMsg)
//            })


        default:
            break
        }
    }
    
}


extension RecordController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item < self.items.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTableCell", for: indexPath) as! TextFieldTableCell
            let item = self.items[indexPath.item]
            cell.titleLabel.text = item.title
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SingleButtonTableCell", for: indexPath) as! SingleButtonTableCell
            cell.dividerLine.isHidden = true
            cell.button.setTitle("记录", for: UIControl.State.normal)
            cell.button.tag = saveButtonTag
            cell.button.addTarget(self, action: #selector(onBtnClick), for: UIControl.Event.touchUpInside)
            return cell
        }
    }
}

extension RecordController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = self.items[indexPath.item]
        //
        //        let alertController = UIAlertController(title: item, message: "is in da house!", preferredStyle: .alert)
        //        let action = UIAlertAction(title: "Ok", style: .default) { _ in }
        //        alertController.addAction(action)
        //        self.present(alertController, animated: true, completion: nil)
        
        let hitoryRecordController = HistoryRecordController()
        hitoryRecordController.recordType = item.type
        self.navigationController?.pushViewController(hitoryRecordController, animated: true)
    }
}

extension RecordController: UITextFieldDelegate {
    
}

