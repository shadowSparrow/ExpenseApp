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
        tableView.backgroundColor = .cyan
        
        tableView.register(DetailExpensesTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: elementsIdentifiers.headerID)
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: elementsIdentifiers.cellID)
        
        
        return tableView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        
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
        button.layer.cornerRadius = 35
        button.addTarget(self, action: #selector(addExpenseButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private let addExpenseLabel: UILabel = {
        let label = UILabel()
        label.text = elemensNames.addExpense
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let operationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.isHidden = true
        stackView.axis = .vertical
        stackView.spacing = 16
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
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        textField.textAlignment = .left
        textField.backgroundColor = .white
        
        textField.layer.cornerRadius = 4
        textField.attributedPlaceholder = NSAttributedString(
            string: elemensNames.addExpenseAmount,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        textField.textColor = .label
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
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
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)]
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        
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
        
        
        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(guide)
            make.height.equalTo(guide.snp.height).dividedBy(2)
        }
        
        button.snp.makeConstraints({ make in
            make.height.width.equalTo(70)
            make.top.equalTo(stackView.snp.top)
        })
        
        addExpenseLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(stackView.safeAreaInsets)
            make.height.equalTo(64)
        }
        
        stackView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(guide)
        }
        
        
    }
    
    private func setOperationElementsContraints() {
        let guide = self.view.safeAreaLayoutGuide
        
        
        NSLayoutConstraint.activate([
        operationStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        operationStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
        operationStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
        operationStackView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -16),
        
        purposeTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
        purposeTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
        purposeTextField.heightAnchor.constraint(equalToConstant: 40),
        
        amountTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
        amountTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8),
        amountTextField.heightAnchor.constraint(equalToConstant: 40.0),
        
        dateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8.0),
        dateTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 8.0),
        dateTextField.heightAnchor.constraint(equalToConstant: 40.0)
        
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
        37.0
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



