//
//  TabBarViewController.swift
//  ExpenseApp
//
//  Created by Игорь Зайченко on 18.06.2023.
//

import UIKit


class TabBarViewController: UITabBarController {
    var expensesVC = UINavigationController(rootViewController: ExpenseViewController())
        var expensesGraphVC = UINavigationController()
        var incomeVC = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Прописать в ручную на занятии
        let controllers: [UINavigationController] = Tabs.allCases.map { tab in
            let controller = UINavigationController(rootViewController: setController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Tabs.rawSting(tab: tab),
                                                 image: UIImage(systemName: "circle"),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    


    private func setController(for tab: Tabs) -> UIViewController {
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
