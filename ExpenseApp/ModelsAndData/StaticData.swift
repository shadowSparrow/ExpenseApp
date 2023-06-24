//
//  StaticData.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import Foundation

enum Tabs: Int, CaseIterable {
    case income
    case chart
    case expenses
    static func rawSting(tab: Tabs)-> String {
        switch tab {
        case .income: return "Доходы"
        case.chart: return "График"
        default: return "Расход"
        }
    }
}

enum elemensNames {
    //Buttons
    static let addExpenseGathegory = "Добавить категорию расходов"
    static let addExpense = "Добавить расход"
    static let addExpenseAmount = "Укажите сумму"
    static let addExpenseData = "Укажите дату"
    
    //TextFields
    static let addGathegoryPlaceHolder = "наименование"
    
    //TableView
    static let accessoryImagesName = "chevron.right"
    
    //TabBar
    static let tabBarIconName = "circle"
}

enum elementsIdentifiers {
    static let datePickerID = "datePicker"
    static let headerID = "header"
    static let cellID = "cell"
}


enum elementsSize {
    
    
    enum expenseVC {
        static let rowHeight = 64
        static let tableBottomConstraint = 60
        static let buttonLeadingConstraint = 16
        static let buttonTrailingConstraint = -16
        static let buttonHeight = 58
        static let buttonBottonConstraint = -229
    }
    
    
    enum expenseDetailVC {
        
        static let tableViewRowHeight = 37.0
        static let tableViewBottomConstraint = -300.0
        
        static let labelHeight = 64.0
        static let detailExpenseVCRowHeight = 37
    
        static let stackViewBottom = -16.0
        static let textFieldTrailingConstraint = 8.0
        static let textFieldLeadingingConstraint = 8.0
        static let textFieldHeightConstraint = 40.0
        
        static let buttonHeight = 70.0
        static let buttonWindh = 70.0
        static let buttonBottonConstraint = -229.0
        
        static let navigationTitleSize = 20.0
        static let textFieldTextSize = 16.0
        static let textFieldCornerRadius = 4.0
        
        static let buttonTextSize = 22.0
        static let labelTextSize = 22.0
        static let buttonCornerRadius = 35.0
        static let stackViewSpacing = 16.0
    }
    
    
}
/*
operationStackView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -16),

purposeTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
purposeTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
purposeTextField.heightAnchor.constraint(equalToConstant: 40),

amountTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
amountTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
amountTextField.heightAnchor.constraint(equalToConstant: 40),

dateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
dateTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
dateTextField.heightAnchor.constraint(equalToConstant: 40)
*/
