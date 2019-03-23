//
//  SingleButtonTableCell.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/3/16.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation

import UIKit

import SnapKit

class SingleButtonTableCell: UITableViewCell {
    
    var button: UIButton!
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
        
        button = UIButton()
        self.contentView.addSubview(button!)
        button.snp.makeConstraints{ (maker) -> Void in
            maker.centerY.equalTo(weakSelf!.contentView)
            maker.centerX.equalTo(weakSelf!.contentView)
            maker.width.equalTo(100)
        }
        button.backgroundColor = UIColor(hex: "#FF2D55")

        dividerLine = UIView()
        dividerLine.backgroundColor = UIColor.init(hex: "#55222222")
        self.contentView.addSubview(dividerLine)
        
        dividerLine.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(weakSelf!.contentView.snp.bottom)
            maker.left.equalTo(weakSelf!.contentView.snp.left).offset(20)
            maker.width.equalTo(weakSelf!.contentView.snp.width).offset(-20)
            maker.height.equalTo(1)
        }
        
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.button.setTitle("", for: UIControl.State.normal)
        
    }
    
    
    
}
