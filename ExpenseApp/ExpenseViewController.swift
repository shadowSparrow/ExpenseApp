//
//  ExpenseViewController.swift
//  ExpenseApp
//
//  Created by Игорь Зайченко on 18.06.2023.
//

import UIKit

class ExpenseViewController: UIViewController {


    private lazy var tableView: UITableView = {
            let tableView = UITableView()
            //tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = .white
            tableView.translatesAutoresizingMaskIntoConstraints = false
            return tableView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        let guide = self.view.safeAreaLayoutGuide
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -60).isActive = true
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ExpenseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        let image = UIImage(systemName: "chevron.right")
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = "ячейка"
        
        let accessory = UIImageView(image: image)
        accessory.tintColor = .blue
        cell.accessoryView = accessory
        return cell
    }
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //let detailVC = ExpenseDetailsViewController()
        let cell = tableView.cellForRow(at: indexPath)
       // detailVC.text = cell?.textLabel?.text ?? "Wrong"
        show(detailVC, sender: nil)
    }
     */
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        64
    }
    */
}
