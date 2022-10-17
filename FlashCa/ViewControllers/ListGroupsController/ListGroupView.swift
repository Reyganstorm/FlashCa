//
//  ListGroupView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import Foundation
import UIKit
import SnapKit

class ListGroupView: UIView {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
        table.backgroundColor = .clear
        return table
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ListGroupView {
    func addTableViewDelegate(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}
