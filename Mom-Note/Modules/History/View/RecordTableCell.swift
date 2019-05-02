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
    var recordLabel: UILabel!
    var dividerLine: UIView!
    
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
        recordLabel = UILabel()
        recordLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(recordLabel)
        dividerLine = UIView()
        dividerLine.backgroundColor = UIColor.init(hex: "#55222222")
        self.contentView.addSubview(dividerLine)
        
        timeLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.contentView)
            maker.bottom.equalTo(weakSelf!.contentView)
            maker.left.equalTo(weakSelf!.contentView).offset(10)
            maker.width.equalTo(weakSelf!.contentView.snp.width).multipliedBy(0.5)
        }

        recordLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.timeLabel)
            maker.bottom.equalTo(weakSelf!.timeLabel)
            maker.left.equalTo(weakSelf!.timeLabel.snp.right)
            maker.width.equalTo(weakSelf!.contentView.snp.width).multipliedBy(0.5)
        }
        
        dividerLine.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(weakSelf!.contentView.snp.bottom)
            maker.left.equalTo(weakSelf!.contentView.snp.left).offset(20)
            maker.width.equalTo(weakSelf!.contentView.snp.width).offset(-20)
            maker.height.equalTo(1)
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
        self.recordLabel.text = ""

    }
}
