//
//  StaticData.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit

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


enum Colors {
    static let background = UIColor(hexString: "#F8F9F9")
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
    
    static let graphVCtitle = "График"
    static let weekButtonName = "Неделя"
    static let monthButtonName = "Месяц"
    static let quarterButtonName = "Квартал"
    static let yearButtonName = "Год"
    
    static let expenseVCtitle = "Расходы"
    static let incomeVCtitle = "Доходы"
    static let chartInfoLabel = "Выберите период для отображения графика" 
}

enum elementsIdentifiers {
    static let datePickerID = "datePicker"
    static let headerID = "header"
    static let cellID = "cell"
}
