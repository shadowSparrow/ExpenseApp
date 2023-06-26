//
//  DatePickerView.swift
//  ExpenseApp
//
//  Created by mac on 26.06.2023.
//

import UIKit

enum DatePickerPeriod {
    case week
    case month
    case quarter
    case year
}

class DatePickerView: UIView {
    
    private lazy var fromDateTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        return textField
    }()
    
    private lazy var tillTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        return textField
    }()
    
    private lazy var periodTextField: UITextField = {
        let textField = UITextField()
        textField.isHidden = true
        return textField
    }()
    
   private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        return datePicker
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


