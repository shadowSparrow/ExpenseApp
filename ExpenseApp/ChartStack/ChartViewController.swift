//
//  ChartViewController.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit

class ChartViewController: UIViewController {

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
        //button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.black.cgColor
        
        
        /*
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    //self?.showTimeIntervalSelectionScreen(type: .week)
                }
            ),
            for: .touchUpInside
        )
         */
        return button
    }()
    
    private lazy var monthButton: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.monthButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underLine()
        
        button.addTarget(self, action: #selector(showDatePickers), for: .touchUpInside)
        //button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.black.cgColor
        /*
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    //self?.showTimeIntervalSelectionScreen(type: .week)
                }
            ),
            for: .touchUpInside
        )
         */
        return button
    }()

    private lazy var quarterButton: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.quarterButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underLine()
        
        //button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.black.cgColor
        /*
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    //self?.showTimeIntervalSelectionScreen(type: .week)
                }
            ),
            for: .touchUpInside
        )
         */
        return button
    }()
    
    private lazy var yearButton: UIButton = {
        let button = UIButton()
        button.setTitle(elemensNames.yearButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.underLine()
        
        //button.layer.borderWidth = 1
        //button.layer.borderColor = UIColor.black.cgColor
        /*
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    //self?.showTimeIntervalSelectionScreen(type: .week)
                }
            ),
            for: .touchUpInside
        )
         */
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

    /*
    private let titleChartViewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        //label.font = Const.Fonts.helveticaNeueCyrBlack(size: 12)
        label.textColor = .label
        return label
    }()
    */

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
    

   // private let graphSymbolsStackView = GraphSymbolsStackView()
    
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
            .font: UIFont.systemFont(ofSize: elementsSize.GraphVC.titleFontSize)
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
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        backViewChart.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 32).isActive = true
        backViewChart.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        backViewChart.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        backViewChart.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        chartInformationLabel.topAnchor.constraint(equalTo: backViewChart.topAnchor, constant: 32).isActive = true
        chartInformationLabel.bottomAnchor.constraint(equalTo: backViewChart.bottomAnchor, constant: -32).isActive = true
        chartInformationLabel.leadingAnchor.constraint(equalTo: backViewChart.leadingAnchor, constant: 16).isActive = true
        chartInformationLabel.trailingAnchor.constraint(equalTo: backViewChart.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc func showDatePickers() {
        let view = DatePickerView()
    }
    
}
