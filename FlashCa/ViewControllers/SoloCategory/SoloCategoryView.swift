//
//  SoloCategoryView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 23.01.2023.
//

import UIKit

class SoloCategoryView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Categories:"
        label.textColor = .black
        label.numberOfLines = 0
        label.font = Resources.Fonts.helveticaBold(with: 30)
        return label
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
}

private extension SoloCategoryView {
    func addViews() {}
    
    func layoutViews() {}
    
    func configure() {}
}
