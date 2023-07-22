//
//  ChartViewController.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit
//import SnapKit

class ChartViewController: UIViewController {

    
    private var datePickerView: DatePickerView?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        //stackView.backgroundColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var weekButton: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.weekButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underLine()
        //button.addTarget(self, action: #selector(showDatePickers), for: .touchUpInside)
        //button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.black.cgColor
        
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showDatePickers(type: .week)
                }
            ),
            for: .touchUpInside
        )
         
        return button
    }()
    
    private lazy var monthButton: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.monthButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underLine()
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showDatePickers(type: .month)
                }
            ),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var quarterButton: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.quarterButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underLine()
        

        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showDatePickers(type: .quarter)
                }
            ),
            for: .touchUpInside
        )
        
        return button
    }()
    
    private lazy var yearButton: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.yearButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underLine()
        
        
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showDatePickers(type: .year)
                }
            ),
            for: .touchUpInside
        )
        return button
    }()

    private let backViewChart: UIView = {
        let view = UIView(frame: CGRect(origin: CGPoint(x:10 , y: 10), size: CGSize(width: 0, height: 300)))
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.separator.cgColor
        view.layer.borderWidth = 1.0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let chartInformationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = elemensNames.chartInfoLabel
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        label.textColor = .tertiaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hexString: "#F8F9F9")
        setUIElements()
        setConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func setUIElements() {
        
        title = elemensNames.graphVCtitle
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .separator
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 24)
        ]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        stackView.addArrangedSubview(weekButton)
        stackView.addArrangedSubview(monthButton)
        stackView.addArrangedSubview(quarterButton)
        stackView.addArrangedSubview(yearButton)
        
        self.view.addSubview(stackView)
        self.view.addSubview(backViewChart)
        self.view.addSubview(chartInformationLabel)
        
    }
    
    private func setConstraints() {
       
        stackView.snp.makeConstraints { make in
            make.trailing.leading.top.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(50)
        }
        
        backViewChart.snp.makeConstraints { make in
            make.trailing.leading.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(stackView.snp.bottom).offset(15)
            make.height.equalTo(view.snp.height).dividedBy(3)
        }
    
    }
    
    private func showDatePickers(type: DatePickerType) {
        
        
        view.isUserInteractionEnabled = false
        let view = DatePickerView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        view.configure(type: type)
        self.view.addSubview(view)
        
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        // Constraints
        view.topAnchor.constraint(equalTo: backViewChart.bottomAnchor, constant: 40).isActive = true
        view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        view.button.addTarget(self, action: #selector(createGraph), for: .touchUpInside)
        
       
    }
    
    @objc func createGraph() {
        stackView.isUserInteractionEnabled = false
        guard let datePickerView = datePickerView else {return}
        datePickerView.isHidden = true
    }
    
}
