//
//  TabBarViewController.swift
//  ExpenseApp
//
//  Created by Игорь Зайченко on 18.06.2023.
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

class TabBarViewController: UITabBarController {
    var expensesVC = UINavigationController(rootViewController: ExpenseViewController())
        var expensesGraphVC = UINavigationController()
        var incomeVC = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Прописать в ручную на занятии
        let controllers: [UINavigationController] = Tabs.allCases.map { tab in
            let controller = UINavigationController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Tabs.rawSting(tab: tab),
                                                 image: UIImage(systemName: "circle"),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .income:
            return IncomeViewController()
        case .chart:
            return ChartViewController()
        case .expenses:
            return ExpenseViewController()
        }
    }
    
}
