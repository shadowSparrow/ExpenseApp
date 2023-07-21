//
//  IncomeViewController.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit
import SnapKit

class IncomeViewController: UIViewController {
/*
    Проект содержит следующие индикаторы проверки
    Проект в Figma
    Главный экран
     • Выводится текущий баланс и список категорий расходов.
     • Есть кнопка для добавления дохода (увеличивает баланс, доходы кешируются на телефоне).
     • Можно создать новую категорию расходов (кешируется после создания).
     • Можно перейти на график расходов/доходов.
    Экран графика расходов/доходов
     • Можно выбрать промежуток: неделя, месяц, квартал, всё время.
     • Для выбранного промежутка показывается график расходов и доходов по дням.
    Экран категории расходов
     • Кнопка для перехода на просмотр графика платежей.
     • Выводятся все расходы в этой категории с датой расхода.
     • Можно создать новый расход (расходы кешируются).
    Экран графика платежей
     • Можно выбрать промежуток: неделя, месяц, квартал, всё время.
     • Для выбранного промежутка показывается график расходов по этой категории.
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = Colors.background
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
            .font: UIFont.systemFont(ofSize: 24)
        ]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
    }

}
