//
//  ExpenseDetailViewController.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit

class ExpenseDetailViewController: UIViewController {

    var text: String = "Ремонт"
    
    var currentGarhegory: ExpenseGathegory!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        
        tableView.register(DetailExpensesTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: elementsIdentifiers.headerID)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: elementsIdentifiers.cellID)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = elementsSize.expenseDetailVC.stackViewSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "plus")
        button.setImage(image, for: .normal)
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        button.configuration = config
        button.backgroundColor = .blue
        button.layer.cornerRadius = elementsSize.expenseDetailVC.buttonCornerRadius
        button.addTarget(self, action: #selector(addExpenseButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addExpenseLabel: UILabel = {
        let label = UILabel()
        label.text = elemensNames.addExpense
        label.font = UIFont.systemFont(ofSize: elementsSize.expenseDetailVC.labelTextSize, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let operationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.isHidden = true
        stackView.axis = .vertical
        stackView.spacing = elementsSize.expenseDetailVC.stackViewSpacing
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var purposeTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 220, height: 40 ))
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.underlined()
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString (
            string: elemensNames.addExpense,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.layer.cornerRadius = elementsSize.expenseDetailVC.textFieldCornerRadius
        textField.textColor = .label
        textField.font = UIFont.systemFont(ofSize: elementsSize.expenseDetailVC.textFieldTextSize, weight: .medium)
        textField.autocapitalizationType = .none
        textField.keyboardType = .default
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var amountTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        textField.textAlignment = .left
        textField.backgroundColor = .white
        
        textField.layer.cornerRadius = elementsSize.expenseDetailVC.textFieldCornerRadius
        textField.attributedPlaceholder = NSAttributedString(
            string: elemensNames.addExpenseAmount,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.textColor = .label
        textField.font = UIFont.systemFont(ofSize: elementsSize.expenseDetailVC.textFieldTextSize, weight: .medium)
        textField.autocapitalizationType = .none
        textField.keyboardType = .decimalPad
        textField.underlined()
        textField.delegate = self
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: elementsIdentifiers.datePickerID)
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .compact
        
        return datePicker
    }()
    
    private lazy var dateTextField: UITextField = {
        let textField = UITextField()
        let label = UILabel()
        label.text = elemensNames.addExpenseData
        label.textAlignment = .right
        
        textField.leftView = label
        textField.delegate = self
        textField.leftViewMode = .always
        textField.rightView = datePicker
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    var isShowingKeybord = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = text
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: elementsSize.expenseDetailVC.navigationTitleSize,weight: .medium)]
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        
        print(currentGarhegory.gathegory)

        setUIElements()
        setConstraints()
        setOperationElements()
        setOperationElementsContraints()
        setKeyboardNotification()
    }
    
}

extension ExpenseDetailViewController {
    
    @objc func addExpenseButtonPressed() {
        
        if button.backgroundColor == UIColor.lightGray {
            button.backgroundColor = UIColor.blue
            operationStackView.isHidden = true
            let date = datePicker.date
            let formattedDate = datePicker.getSelectedDate(date)
            let newExpense = ExpenseModel(description: purposeTextField.text ?? "пусно", amount: Int(amountTextField.text!) ?? 0, date: formattedDate)
            
            currentGarhegory.expenses?.append(newExpense)
            //print("THIS Array of Expenses \(currentGarhegory.expenses)")
            self.view.endEditing(true)
            tableView.reloadData()
            purposeTextField.text = ""
            amountTextField.text = ""
           }
           else if button.backgroundColor == UIColor.blue {
               button.backgroundColor = UIColor.lightGray
               operationStackView.isHidden = false
               purposeTextField.becomeFirstResponder()
               
           }
    }
    
    private func setUIElements() {
        tabBarController?.tabBar.isHidden = true
        self.view.addSubview(tableView)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(addExpenseLabel)
        self.view.addSubview(stackView)
        
    }
    
    private func setOperationElements() {
        
        operationStackView.addArrangedSubview(purposeTextField)
        operationStackView.addArrangedSubview(amountTextField)
        operationStackView.addArrangedSubview(dateTextField)
        self.view.addSubview(operationStackView)
        
    }
    
   
    private func setConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: elementsSize.expenseDetailVC.tableViewBottomConstraint),
            
            addExpenseLabel.heightAnchor.constraint(equalToConstant: elementsSize.expenseDetailVC.labelHeight),
            addExpenseLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            addExpenseLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            addExpenseLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: elementsSize.expenseDetailVC.buttonHeight),
            button.widthAnchor.constraint(equalToConstant: elementsSize.expenseDetailVC.buttonWindh),
            button.topAnchor.constraint(equalTo: stackView.topAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: elementsSize.expenseDetailVC.buttonBottonConstraint)
                        
            ])
        
    }
    
    
    private func setOperationElementsContraints() {
        let guide = self.view.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
        operationStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        operationStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
        operationStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
        operationStackView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: elementsSize.expenseDetailVC.stackViewBottom),
        
        purposeTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: elementsSize.expenseDetailVC.textFieldLeadingingConstraint),
        purposeTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: elementsSize.expenseDetailVC.textFieldTrailingConstraint),
        purposeTextField.heightAnchor.constraint(equalToConstant: elementsSize.expenseDetailVC.textFieldHeightConstraint),
        
        amountTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: elementsSize.expenseDetailVC.textFieldLeadingingConstraint),
        amountTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: elementsSize.expenseDetailVC.textFieldTrailingConstraint),
        amountTextField.heightAnchor.constraint(equalToConstant: elementsSize.expenseDetailVC.textFieldHeightConstraint),
        
        dateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: elementsSize.expenseDetailVC.textFieldLeadingingConstraint),
        dateTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: elementsSize.expenseDetailVC.textFieldTrailingConstraint),
        dateTextField.heightAnchor.constraint(equalToConstant: elementsSize.expenseDetailVC.textFieldHeightConstraint)
        
        ])
        
    }
    
    private func setKeyboardNotification(){
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    @objc func keyboardWillShow(notification: Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if isShowingKeybord {
                    self.view.frame.origin.y = -keyboardSize.height
                }
            }
        }
    @objc func keyboardWillHide(notification: Notification) {
            self.view.frame.origin.y = 0
        }
    
}



extension ExpenseDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currentGarhegory.expenses?.count ?? 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DetailTableViewCell
        guard let expenses = currentGarhegory.expenses else {return cell}
        
        cell.configure(with: expenses[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        elementsSize.expenseDetailVC.tableViewRowHeight
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = DetailExpensesTableViewHeaderView(reuseIdentifier: "header")
        return header
    }
     
}

extension ExpenseDetailViewController:  UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            isShowingKeybord = true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            isShowingKeybord = false
        }
    
}




