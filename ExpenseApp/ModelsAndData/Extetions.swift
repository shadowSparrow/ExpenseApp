//
//  Extetions.swift
//  ExpenseApp
//
//  Created by mac on 22.06.2023.
//

import Foundation
import UIKit

extension UIDatePicker {
    
    func getSelectedDate(_ enteredDate: Date) -> String {
        let date = enteredDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        let result = dateFormatter.string(from: date)
        return result
    }
    
}

extension UIButton {
    
    func underLine() {
        
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        titleLabel?.attributedText = underlineAttributedString
    }
}

extension UITextField {
    
    func underlined() {
            let border = CALayer()
        let width = CGFloat(0.5)
            border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y:  self.frame.height - width, width: self.frame.width-20, height: 1)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
 
}

//self.frame.size.height - width
