//
//  ImageButton.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 18.01.2023.
//

import UIKit

class ImageButton: UIButton {

    private let image = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ icon: UIImage?) {
        image.image = icon
    }
    
    func setImageColor(_ color: UIColor) {
        image.tintColor = color
    }
}

private extension ImageButton {
    func addViews() {
        addSubview(image)
    }
    
    func layoutViews() {
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure() {
        makeSystem(self)
    }
}
