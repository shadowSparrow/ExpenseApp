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
        return stackView
    }()

    /*
    private lazy var weekButton: CustomTimeLapseButton = {
        let button = CustomTimeLapseButton(title: Const.Strings.weekButtonTitle)
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showTimeIntervalSelectionScreen(type: .week)
                }
            ),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var monthButton: CustomTimeLapseButton = {
        let button = CustomTimeLapseButton(title: Const.Strings.monthButtonTitle)
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showTimeIntervalSelectionScreen(type: .month)
                }
            ),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var quarterButton: CustomTimeLapseButton = {
        let button = CustomTimeLapseButton(title: Const.Strings.quarterButtonTitle)
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showTimeIntervalSelectionScreen(type: .quarter)
                }
            ),
            for: .touchUpInside
        )
        return button
    }()

    private lazy var yearButton: CustomTimeLapseButton = {
        let button = CustomTimeLapseButton(title: Const.Strings.yearButtonTitle)
        button.addAction(
            UIAction(
                handler: { [weak self] _ in
                    self?.showTimeIntervalSelectionScreen(type: .year)
                }
            ),
            for: .touchUpInside
        )
        return button
    }()
*/
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
        
    }
    
}
