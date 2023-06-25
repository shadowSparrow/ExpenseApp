//
//  ChartViewController.swift
//  ExpenseApp
//
//  Created by mac on 19.06.2023.
//

import UIKit

class ChartViewController: UIViewController {

    private let hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var weekButton: UIButton = {
        let button = UIButton()
        //let title = NSAttributedString(markdownString: <#T##String#>, options: <#T##NSAttributedStringMarkdownParsingOptions?#>, baseURL: <#T##URL?#>, including: <#T##AttributeScope.Protocol#>)
        button.setTitle(elemensNames.weekButtonName, for: .normal)
        button.setTitleColor(.black, for: .normal)
        
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
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.separator.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()

    private let titleChartViewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        //label.font = Const.Fonts.helveticaNeueCyrBlack(size: 12)
        label.textColor = .label
        return label
    }()

    private let chartInformationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        //label.text = Const.Strings.chartInformationLabelTitle
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        label.textColor = .tertiaryLabel
        return label
    }()

   // private let graphSymbolsStackView = GraphSymbolsStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
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
        
        hStackView.addArrangedSubview(weekButton)
        hStackView.addArrangedSubview(monthButton)
        hStackView.addArrangedSubview(quarterButton)
        hStackView.addArrangedSubview(yearButton)
        self.view.addSubview(hStackView)
        
    }
    
    private func setConstraints() {
        hStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        hStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    }
    
}
