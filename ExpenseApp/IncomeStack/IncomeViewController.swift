//
//  IncomeViewController.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit

class IncomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .cyan
        setUIElements()
        // Do any additional setup after loading the view.
    }
    
    
    private func setUIElements() {
        
        title = elemensNames.incomeVCtitle
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .separator
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: elementsSize.GraphVC.titleFontSize)
        ]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
    }

}
