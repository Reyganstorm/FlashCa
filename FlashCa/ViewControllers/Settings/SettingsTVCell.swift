//
//  SettingsTVCell.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 06.01.2023.
//

import UIKit

class SettingsTVCell: UITableViewCell {
    
    static let identifier = "SettingsTVCell"

    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = Resources.Colors.inActiv
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = Resources.Colors.mainDark?.cgColor
        return view
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func configure(option: String) {
        title.text = option
        addViews()
        addConstraints()
        selectionStyle = .none
    }
    
    private func addViews() {
        backgroundColor = .clear
        addSubview(backView)
        backView.addSubview(title)
    }
    
    private func addConstraints() {
        
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7.5)
            make.bottom.equalToSuperview().offset(-7.5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        title.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
}
