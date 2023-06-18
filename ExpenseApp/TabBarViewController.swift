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
        self.viewControllers = [incomeVC,expensesGraphVC, expensesVC]
                
                self.expensesVC.title = "Расходы"
                self.expensesGraphVC.title = "График"
                self.incomeVC.title = "Доходы"
        
        self.expensesVC.tabBarItem.image = UIImage(systemName: "circle")
        self.expensesGraphVC.tabBarItem.image = UIImage(systemName: "circle")
        self.incomeVC.tabBarItem.image = UIImage(systemName: "circle")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
