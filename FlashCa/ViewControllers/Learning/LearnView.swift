//
//  LearnView.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 02.11.2023.
//

import UIKit
import SnapKit

final class LearnView: UIView {

    private let backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .white
        return view
    } ()
    
    let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.backgroundColor = .lightGray
        return view
    } ()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Загадка"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    var panGesture = UIPanGestureRecognizer()
    
    let thumbImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "hand.thumbsup.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal)
        image.alpha = 0
        image.contentMode = .scaleAspectFit
      return image
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

extension LearnView {
    func setTargetToPanGestureRec(target:  Any, action: Selector) {
        panGesture = UIPanGestureRecognizer(target: target, action: action)
    }
}

extension LearnView {
    private func addViews() {
        addSubview(backView)
        backView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(thumbImageView)

        cardView.addGestureRecognizer(panGesture)
    }
    
    private func layoutViews() {
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        cardView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(50)
        }
    }
    
    func configure() {
        
    }
}
