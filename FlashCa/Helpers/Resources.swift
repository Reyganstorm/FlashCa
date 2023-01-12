//
//  Resources.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 09.01.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static let background = UIColor(named: "mainLight")
        static let main = UIColor(named: "mainMedium")
        static let mainDark = UIColor(named: "mainDark")
        
        static let activ = UIColor(named: "mainPink")
        static let inActiv = UIColor(named: "mainPinkLight")
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        static func helveticaBold(with size: CGFloat) -> UIFont {
            UIFont(name: "HelveticaBold", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
    enum Images {
        
        enum Common {
            static let rightArrow = UIImage(systemName: "chevron.forward.square")
            static let downArrow = UIImage(systemName: "chevron.down")
            static let settings = UIImage(named: "ic.settings")
        }
    }
}
