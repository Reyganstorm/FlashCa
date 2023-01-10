//
//  WelcomeNavView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 10.01.2023.
//

import UIKit
import SnapKit

class WelcomeNavView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helveticaRegular(with: 23)
        label.textColor = Resources.Colors.mainDark
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}

private extension WelcomeNavView {
    func addViews() {
        addSubview(label)
        addSubview(separator)
    }
    
    func layoutViews() {
        label.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(23)
            make.left.equalToSuperview().offset(25)
            make.centerX.equalToSuperview()
        }
        
        separator.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(18)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(35)
            make.centerX.equalToSuperview()
        }
    }
    
    func configure() {}
}
