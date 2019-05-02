//
//  TextFieldTableCell.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/3/16.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation

import UIKit
import SnapKit


class TextFieldTableCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var inputTF: UITextField!
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
        
        titleLabel = UILabel()
        titleLabel.textAlignment = NSTextAlignment.center
        self.contentView.addSubview(titleLabel)
        inputTF = UITextField()
        inputTF?.keyboardType = UIKeyboardType.numberPad
        inputTF?.borderStyle = UITextField.BorderStyle.roundedRect
        self.contentView.addSubview(inputTF)
        dividerLine = UIView()
        dividerLine.backgroundColor = UIColor.init(hex: "#55222222")
        self.contentView.addSubview(dividerLine)
        
        titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(weakSelf!.contentView)
            maker.bottom.equalTo(weakSelf!.contentView)
            maker.left.equalTo(weakSelf!.contentView).offset(10)
            maker.width.equalTo(150)
        }
        
        inputTF.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(weakSelf!.titleLabel)
            maker.left.equalTo(weakSelf!.titleLabel.snp.right)
            maker.right.equalTo(weakSelf!.contentView.snp.right).offset(-20)
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
        
        self.titleLabel.text = ""
        self.inputTF.text = ""
        
    }
}
