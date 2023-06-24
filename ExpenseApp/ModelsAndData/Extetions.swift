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

func updateAmount(amount: Int) -> String? {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "ru_RU")
    formatter.numberStyle = .currency
    formatter.currencyDecimalSeparator = "."
    let result = Double(amount / 100) + Double(amount % 100) / 100
    return formatter.string(from: NSDecimalNumber(floatLiteral: result))
}
