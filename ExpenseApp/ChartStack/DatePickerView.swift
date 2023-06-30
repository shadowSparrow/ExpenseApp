//
//  DatePickerView.swift
//  ExpenseApp
//
//  Created by mac on 26.06.2023.
//

import UIKit

enum DatePickerType {
    case week
    case month
    case quarter
    case year
}

class DatePickerView: UIStackView {
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    let secondDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        return datePicker
    }()
    
    let datePickerView: UIPickerView = {
        let datePicker = UIPickerView()
        
        return datePicker
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
   
     let button: UIButton = {
        let button = UIButton()
        button.setTitle("Готово", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        
        //button.addTarget(self, action: #selector(createGraph), for: .touchUpInside)
        
        /*
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                

                    
                }
            ),
            for: .touchUpInside
        )
        */
        
        return button
    }()
    
     private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
   private let secondStackStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    
  override init(frame: CGRect) {
        super.init(frame: frame)
      self.axis = .vertical
      self.spacing = 16
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(type: DatePickerType) {
        
        switch type {
        case .week:
            label.text = "выберите начальную дату"
            secondLabel.text = "выберите конечную дату"
            horizontalStackView.addArrangedSubview(label)
            horizontalStackView.addArrangedSubview(datePicker)
            secondStackStackView.addArrangedSubview(secondLabel)
            secondStackStackView.addArrangedSubview(secondDatePicker)
            self.addArrangedSubview(horizontalStackView)
            self.addArrangedSubview(secondStackStackView)
            self.addArrangedSubview(button)
            
        case .month:
            label.text = "отчетный месяц"
            horizontalStackView.addArrangedSubview(label)
            horizontalStackView.addArrangedSubview(datePicker)
            self.addArrangedSubview(horizontalStackView)
            self.addArrangedSubview(button)
        case .quarter:
            label.text = "выберите квартал"
            horizontalStackView.addArrangedSubview(label)
            horizontalStackView.addArrangedSubview(datePicker)
            self.addArrangedSubview(horizontalStackView)
            self.addArrangedSubview(button)
        default:
            label.text = "выберите укажите год"
            horizontalStackView.addArrangedSubview(label)
            horizontalStackView.addArrangedSubview(datePicker)
            self.addArrangedSubview(horizontalStackView)
            self.addArrangedSubview(button)
        }
}
    
    @objc func createGraph(){
        self.isHidden = true
    }
}


