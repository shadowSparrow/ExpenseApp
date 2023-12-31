//
//  ExpenseViewController.swift
//  ExpenseApp
//
//  Created by Игорь Зайченко on 18.06.2023.
//

import UIKit

class ExpenseViewController: UIViewController {

//MARK: - Свойства
    private lazy var tableView: UITableView = {
            let tableView = UITableView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .white
            //tableView.translatesAutoresizingMaskIntoConstraints = false
            return tableView
        }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.addExpenseGathegory, for: .normal)
            button.backgroundColor = .blue
        button.layer.cornerRadius = 24.0
            button.addTarget(self, action: #selector(addExpensesButtonPressed), for: .touchUpInside)
        //button.isHidden = true
            //button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
    lazy var texField: UITextField = {
            let texField = UITextField(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
            texField.isHidden = true
            texField.delegate = self
            texField.attributedPlaceholder = NSAttributedString(
                string: elemensNames.addGathegoryPlaceHolder,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
            )
            texField.textAlignment = .left
        texField.layer.cornerRadius = 4.0
            texField.backgroundColor = .white
            texField.textColor = .black
     
            //texField.translatesAutoresizingMaskIntoConstraints = false
            return texField
        }()
    var isShowingKeybord = false
    var expenses: [ExpenseGathegory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        texField.underlined()
        setUIElements()
        setConstraints()
        setKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setUIElements() {
        title = elemensNames.expenseVCtitle
        tabBarController?.tabBar.isHidden = false
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .separator
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 24)
        ]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

        self.view.addSubview(tableView)
        self.view.addSubview(button)
        self.view.addSubview(texField)
    }
    
    private func setConstraints() {
        let guide = self.view.safeAreaLayoutGuide
 
        tableView.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(guide)
            make.bottom.equalTo(button.snp.topMargin).offset(64)
        }
       
        button.snp.makeConstraints { make in
            make.leading.trailing.equalTo(guide).inset(16)
            make.bottom.equalTo(guide).inset(200)
            make.height.equalTo(50)
        }
        
        texField.snp.makeConstraints { make in
            make.trailing.leading.equalTo(guide).inset(16)
            make.height.equalTo(50)
            make.bottom.equalTo(button.snp.top).offset(-8)
        }
    }
    
    @objc func addExpensesButtonPressed() {
            if button.backgroundColor == UIColor.darkGray {
                   button.backgroundColor = UIColor.blue
                texField.isHidden = true
                let newExpense = ExpenseGathegory(gathegory: texField.text!, expenses: [])
                expenses.append(newExpense)
                tableView.reloadData()
                self.view.endEditing(true)
               }
               else if button.backgroundColor == UIColor.blue {
                   button.backgroundColor = UIColor.darkGray
                   texField.isHidden = false
                   texField.becomeFirstResponder()
               }
        }
    
    private func setKeyboardNotification() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    @objc func keyboardWillShow(notification: Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if isShowingKeybord {
                    self.view.frame.origin.y = -keyboardSize.height/2
                }
            }
        }
    @objc func keyboardWillHide(notification: Notification) {
            self.view.frame.origin.y = 0
        }
}

extension ExpenseViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        expenses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let image = UIImage(systemName: elemensNames.accessoryImagesName)
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = expenses[indexPath.row].gathegory
        let accessory = UIImageView(image: image)
        accessory.tintColor = .blue
        cell.accessoryView = accessory
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = ExpenseDetailViewController()
        let cell = tableView.cellForRow(at: indexPath)
        detailVC.text = cell?.textLabel?.text ?? "Wrong"
        detailVC.currentGarhegory = expenses[indexPath.row]
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
     
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64.0
    }

}

extension ExpenseViewController: UITextFieldDelegate {

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
