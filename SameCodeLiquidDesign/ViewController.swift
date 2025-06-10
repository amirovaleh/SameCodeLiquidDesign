//
//  ViewController.swift
//  SameCodeLiquidDesign
//
//  Created by Valeh Amirov on 10.06.25.
//

import UIKit

class ViewController: UIViewController {
    
    private let data = Array(1...12)
    
    private let segment: UISegmentedControl = {
        let v = UISegmentedControl(items: ["Item 1", "Item 2"])
        v.selectedSegmentIndex = 0
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var tableView: UITableView = {
        let v = UITableView(frame: .zero, style: .insetGrouped)
        v.dataSource = self
        v.delegate = self
        v.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func loadView() {
        view = tableView
        navigationItem.titleView = segment
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: UITableViewCell.description())
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
