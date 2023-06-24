//
//  ExpenseDetailTableViewCell.swift
//  ExpenseApp
//
//  Created by mac on 18.06.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 40
        //stackView.backgroundColor = .cyan
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

     lazy var expenseItemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        //label.text = "на что"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    lazy var expenseTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        //label.text = "когда"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()

    lazy var expenseAmountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        //label.text = "сколько"
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(expenseItemLabel)
        labelsStackView.addArrangedSubview(expenseTimeLabel)
        labelsStackView.addArrangedSubview(expenseAmountLabel)
    }
    
    private func setupConstraints() {
        labelsStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelsStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        labelsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func configure(with expenseData: ExpenseModel) {
        expenseItemLabel.text = expenseData.description
        expenseTimeLabel.text = expenseData.date
        let amount = updateAmount(amount: expenseData.amount)
        expenseAmountLabel.text = amount
    }
    
    func updateAmount(amount: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.numberStyle = .currency
        formatter.currencyDecimalSeparator = "."
        let result = Double(amount / 100) + Double(amount % 100) / 100
        return formatter.string(from: NSDecimalNumber(floatLiteral: result))
    }
}
