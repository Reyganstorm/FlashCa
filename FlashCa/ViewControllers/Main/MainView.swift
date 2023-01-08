//
//  MainView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 16.10.2022.
//

import Foundation
import UIKit
import SnapKit

class MainView: UIView {
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .mainPinkLight
        return scroll
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(scrollView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(10000)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
