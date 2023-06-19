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
    
    //TextFields
    static let addGathegoryPlaceHolder = "наименование"
    
    //TableView
    static let accessoryImagesName = "chevron.right"
}
