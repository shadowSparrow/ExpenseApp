//
//  ExpenseDetailViewController.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit

class ExpenseDetailViewController: UIViewController {

    var text: String = "Ремонт"
    var expenses: [Expense] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        //stackView.backgroundColor = .gray
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        
        let image = UIImage(systemName: "plus.circle")
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 60
        button.addTarget(self, action: #selector(addExpenseButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addExpenseLabel: UILabel = {
        let label = UILabel()
        label.text = elemensNames.addExpense
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let operationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.isHidden = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let purposeTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.backgroundColor = .white
        
        textField.attributedPlaceholder = NSAttributedString(
            string: elemensNames.addGathegoryPlaceHolder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.layer.cornerRadius = 4
        textField.textColor = .label
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var amountTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.backgroundColor = .white
        
        textField.layer.cornerRadius = 4
        textField.attributedPlaceholder = NSAttributedString(
            string: elemensNames.addGathegoryPlaceHolder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.textColor = .label
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.autocapitalizationType = .none
        textField.keyboardType = .decimalPad
        textField.delegate = self
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        //datePicker.locale = Locale(identifier: Const.Strings.localIdentifier)
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .compact
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = text
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true

        setUIElements()
        setConstraints()
        setOperationElements()
        setOperationElementsContraints()
        
    }
    
}

extension ExpenseDetailViewController {
    @objc func addExpenseButtonPressed() {
        
    }
    
    private func setUIElements() {
        
        self.view.addSubview(tableView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(addExpenseLabel)
        self.view.addSubview(stackView)
        
        
    }
    
    private func setOperationElements() {
        
        operationStackView.addArrangedSubview(purposeTextField)
        operationStackView.addArrangedSubview(amountTextField)
        operationStackView.addArrangedSubview(datePicker)
        self.view.addSubview(operationStackView)
        
        
    }
    
   
    
    private func setConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -300),
            
            addExpenseLabel.heightAnchor.constraint(equalToConstant: 64),
            addExpenseLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            addExpenseLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            addExpenseLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 96),
            button.widthAnchor.constraint(equalToConstant: 96),
            button.topAnchor.constraint(equalTo: stackView.topAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -128)
                        
            ])
        
    }
    
    
    private func setOperationElementsContraints() {
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        
        operationStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        operationStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
        operationStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
        operationStackView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -8),
        
        purposeTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        purposeTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        
        amountTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
        amountTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        
        ])
        
    }
}



extension ExpenseDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = DetailTableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = .black
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        37
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DetailExpensesTableViewHeaderView(reuseIdentifier: "header")
        return header
    }
     
}

extension ExpenseDetailViewController:  UITextFieldDelegate{
    
}




