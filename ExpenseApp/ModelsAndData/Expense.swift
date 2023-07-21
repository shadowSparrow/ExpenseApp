//
//  Expense.swift
//  ExpenseApp
//
//  Created by Игорь Зайченко on 18.06.2023.
//

import Foundation

struct ExpenseGathegory {
    let gathegory: String
    var expenses: [ExpenseModel]?
    
}

struct ExpenseModel  {
    let description: String
    let amount: Int
    let date: String
}

