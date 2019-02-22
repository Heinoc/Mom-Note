//
//  RecordTableCell.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/2/12.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class RecordTableCell: UITableViewCell {
    
    var timeLabel: UILabel!
    var weightLabel: UILabel!
    var waistlineLabel: UILabel!
    var hiplineLabel: UILabel!
    var thighlineLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    func initialize() {
        
        weak var weakSelf = self
        
        timeLabel = UILabel()
        timeLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(timeLabel)
        weightLabel = UILabel()
        weightLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(weightLabel)
        waistlineLabel = UILabel()
        waistlineLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(waistlineLabel)
        hiplineLabel = UILabel()
        hiplineLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(hiplineLabel)
        thighlineLabel = UILabel()
        thighlineLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(thighlineLabel)
        
        timeLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.contentView)
            maker.bottom.equalTo(weakSelf!.contentView)
            maker.left.equalTo(weakSelf!.contentView).offset(10)
            maker.width.equalTo(weakSelf!.contentView.snp.width).multipliedBy(0.3).offset(-20)
        }

        weightLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.timeLabel)
            maker.bottom.equalTo(weakSelf!.timeLabel)
            maker.left.equalTo(weakSelf!.timeLabel.snp.right)
            maker.width.equalTo(weakSelf!.contentView.snp.width).multipliedBy(0.7 / 4)
        }
        
        waistlineLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.timeLabel)
            maker.bottom.equalTo(weakSelf!.timeLabel)
            maker.left.equalTo(weakSelf!.weightLabel.snp.right)
            maker.width.equalTo(weakSelf!.weightLabel.snp.width)
        }
        
        hiplineLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.timeLabel)
            maker.bottom.equalTo(weakSelf!.timeLabel)
            maker.left.equalTo(weakSelf!.waistlineLabel.snp.right)
            maker.width.equalTo(weakSelf!.weightLabel.snp.width)
        }
        
        thighlineLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.timeLabel)
            maker.bottom.equalTo(weakSelf!.timeLabel)
            maker.left.equalTo(weakSelf!.hiplineLabel.snp.right)
            maker.right.equalTo(weakSelf!.contentView).offset(-10)
            maker.width.equalTo(weakSelf!.weightLabel.snp.width)
        }
        
    }
    /*
     override func awakeFromNib() {
     super.awakeFromNib()
     
     }
     */
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.timeLabel.text = ""
        self.weightLabel.text = ""
        self.waistlineLabel.text = ""
        self.hiplineLabel.text = ""
        self.thighlineLabel.text = ""

    }
}
