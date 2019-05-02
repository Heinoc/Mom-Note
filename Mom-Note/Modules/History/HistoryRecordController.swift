//
//  HistoryRecordController.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/2/28.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import UIKit

import Toast_Swift
import MJRefresh

class HistoryRecordController: BaseViewController {
    
    var recordType : Record.RecordType?
    
    
    var timeLabel: UILabel!
    var recordLabel: UILabel!
    var dividerLineView: UIView!
    
    var tableView: UITableView!
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    var items: [Record] = []
    
    var pageNum = 1
    var pageSize = 20
//    
//    init(recordType: Record.RecordType) {
//        self.recordType = recordType
//        
//        
//    }
    
    override func loadView() {
        super.loadView()
        
        initView()
        
    }
    
    func initView() {
        
        weak var weakSelf = self
        let statusHeight = (self.navigationController?.navigationBar.frame.size.height)! + UIApplication.shared.statusBarFrame.size.height
        
        timeLabel = UILabel()
        timeLabel.text = "时间"
        timeLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(timeLabel)
        recordLabel = UILabel()
        recordLabel.text = "记录"
        recordLabel.textAlignment = NSTextAlignment.center
        self.view.addSubview(recordLabel)
        dividerLineView = UIView()
        dividerLineView.backgroundColor = UIColor.gray
        self.view.addSubview(dividerLineView)
        
        timeLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.view).offset(statusHeight + 10)
            maker.left.equalTo(weakSelf!.view)
            maker.width.equalTo(weakSelf!.view.snp.width).multipliedBy(0.5)
            maker.height.equalTo(40)
        }
        
        recordLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.timeLabel)
            maker.bottom.equalTo(weakSelf!.timeLabel)
            maker.left.equalTo(weakSelf!.timeLabel.snp.right)
            maker.width.equalTo(weakSelf!.view.snp.width).multipliedBy(0.5)
        }
        

        dividerLineView.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.timeLabel.snp.bottom)
            maker.left.equalTo(weakSelf!.view)
            maker.right.equalTo(weakSelf!.view)
            maker.height.equalTo(1)
        }
        
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.dividerLineView.snp.bottom)
            maker.bottom.equalTo(weakSelf!.view)
            maker.left.equalTo(weakSelf!.view)
            maker.right.equalTo(weakSelf!.view)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(RecordTableCell.self, forCellReuseIdentifier: "RecordTableCell")
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(refresh))
        // 现在的版本要用mj_header
        self.tableView.mj_header = header
        
        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(loadMore))
        self.tableView.mj_footer = footer
        
        self.tableView.mj_header.beginRefreshing()
        
    }
    
    @objc func refresh() {
        pageNum = 1
        loadData()
    }
    
    @objc func loadMore() {
        pageNum += 1
        loadData()
    }
    
    func loadData() {
        
        ServerAPI.getRecords(userID: "bhtrgormvbapu6it7880",
                             pageNum: pageNum,
                             pageSize: pageSize,
                             onSuccess: { (response) in
                                
                                let list = (response as! RecordHistoryResponse).list!
                                
                                if self.pageNum == 1 {
                                    self.items = list
                                    
                                    self.tableView.mj_header.endRefreshing()
                                    self.tableView.mj_footer.resetNoMoreData()
                                } else {
                                    self.items += list
                                    
                                    self.tableView.mj_footer.endRefreshing()
                                }
                                
                                if list.count < self.pageSize {
                                    self.tableView.mj_footer.endRefreshingWithNoMoreData()
                                }
                                
                                self.tableView.reloadData()
                                
        },onFail: { (errMsg) in
            self.view.makeToast(errMsg)
        })
        
    }
    
    func getTime(time: String) -> String {
        // create a date formatter
        let dateFormatter = DateFormatter()
        // setup formate string for the date formatter
        dateFormatter.dateFormat = "yyyy-MM-dd_HH:mm:ss"
        // format the current date and time by the date formatter
        let dateStr = dateFormatter.string(from: stringConvertDate(string: time))
        return dateStr
    }
    
    func stringConvertDate(string:String, dateFormat:String="yyyy-MM-dd HH:mm:ss") -> Date {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: string)
        return date!
    }
    
}


extension HistoryRecordController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordTableCell", for: indexPath) as! RecordTableCell
        let item = self.items[indexPath.item]
        cell.timeLabel.text = item.createdTime
        cell.recordLabel.text = item.getItemValue(by: self.recordType!)
        
        return cell
    }
}

extension HistoryRecordController: UITableViewDelegate {
    
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
    }
}
