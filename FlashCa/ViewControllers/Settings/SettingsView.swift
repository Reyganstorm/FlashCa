//
//  SettingsView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 06.01.2023.
//

import UIKit
import SnapKit

class SettingsView: UIView {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SettingsTVCell.self, forCellReuseIdentifier: SettingsTVCell.identifier)
        table.backgroundColor = .clear
        table.separatorStyle = .none
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

extension SettingsView {
    func addTableViewDelegate(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
}
