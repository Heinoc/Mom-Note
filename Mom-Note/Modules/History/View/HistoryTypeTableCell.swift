//
//  HistoryTypeTableCell.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/2/28.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class HistoryTypeTableCell: UITableViewCell {
    
    var iconIV: UIImageView!
    var titleLabel: UILabel!
    var arrowIV: UIImageView!
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
        
        iconIV = UIImageView()
        self.contentView.addSubview(iconIV)
        titleLabel = UILabel()
        self.contentView.addSubview(titleLabel)
        arrowIV = UIImageView()
        self.contentView.addSubview(arrowIV)
        dividerLine = UIView()
        dividerLine.backgroundColor = UIColor.init(hex: "#55222222")
        self.contentView.addSubview(dividerLine)
        
        iconIV.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.contentView)
            maker.bottom.equalTo(weakSelf!.contentView)
            maker.left.equalTo(weakSelf!.contentView).offset(10)
            maker.width.equalTo(40)
            maker.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.contentView)
            maker.bottom.equalTo(weakSelf!.contentView)
            maker.left.equalTo(weakSelf!.iconIV.snp.right).offset(10)
            maker.right.equalTo(weakSelf!.arrowIV.snp.left).offset(-10)
        }
        
        arrowIV.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.contentView)
            maker.bottom.equalTo(weakSelf!.contentView)
            maker.right.equalTo(weakSelf!.contentView).offset(-10)
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
        
        self.iconIV.image = UIImage.init(named: "")
        self.titleLabel.text = ""
        
    }
}
