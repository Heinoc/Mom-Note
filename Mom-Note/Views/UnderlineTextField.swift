//
//  UnderlineTextField.swift
//  Mom-Note
//
//  Created by Heinoc on 2019/3/22.
//  Copyright © 2019 Heinoc. All rights reserved.
//

import Foundation
import UIKit

class UnderlineTextField: UITextField {
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
//        context.draw(<#T##layer: CGLayer##CGLayer#>, in: CGRect(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5))
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: self.bounds.height - 0.5))
        path.addLine(to: CGPoint(x: 0, y: self.bounds.height - 0.5))
        path.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height - 0.5))
        
        context.addPath(path)
        
        context.setStrokeColor(UIColor.black.cgColor)
        
        context.setLineWidth(0.5)
        
        context.strokePath()

    }
    
}
