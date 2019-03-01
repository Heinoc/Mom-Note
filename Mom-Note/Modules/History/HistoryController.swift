//
//  HistoryController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/1/2.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import UIKit

class HistoryController: BaseViewController {
    
    var tableView: UITableView!
    
    var items: [HistoryType] = []
    
    override func loadView() {
        super.loadView()
        
        initView()

    }
    
    func initView() {
        
        weak var weakSelf = self
        let statusHeight = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height

        tableView = UITableView(frame: .zero, style: .plain)
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
        
        self.tableView.register(HistoryTypeTableCell.self, forCellReuseIdentifier: "HistoryTypeTableCell")
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        loadData()
        
    }
    
    func loadData() {
        
        items = []
        
        items.append(HistoryType(icon: "", title: "体重", type: "weight"))
        items.append(HistoryType(icon: "", title: "腰围", type: "waistline"))
        items.append(HistoryType(icon: "", title: "胸围", type: "bust"))
        items.append(HistoryType(icon: "", title: "臀围", type: "hipline"))
        items.append(HistoryType(icon: "", title: "大腿围", type: "thighline"))
        
    }
    
}


extension HistoryController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTypeTableCell", for: indexPath) as! HistoryTypeTableCell
        let item = self.items[indexPath.item]
        cell.titleLabel.text = item.title
        return cell
    }
}

extension HistoryController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let item = self.items[indexPath.item]
//
//        let alertController = UIAlertController(title: item, message: "is in da house!", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Ok", style: .default) { _ in }
//        alertController.addAction(action)
//        self.present(alertController, animated: true, completion: nil)
        
        let hitoryRecordController = HistoryRecordController()
        self.navigationController?.pushViewController(hitoryRecordController, animated: true)
    }
}
