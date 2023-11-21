//
//  Resources.swift
//  FlashCa
//
//  Created by Руслан Штыбаев on 09.01.2023.
//

import UIKit

enum Resources {
    enum Colors {
        static let background = UIColor.white
        static let main = UIColor.blue
        static let mainDark = UIColor.darkGray
        
        static let activ = UIColor.black
        static let inActiv = UIColor.gray
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
        
        
        
        static func helveticaBold(with size: CGFloat) -> UIFont {
            UIFont(name: "HelveticaBold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
        }
    }
    
    enum Images {
        enum Common {
            static let rightArrow = UIImage(systemName: "chevron.compact.right")
            static let downArrow = UIImage(systemName: "chevron.down")
            static let settings = UIImage(named: "ic.settings")
            static let add = UIImage(systemName: "plus.square")
            static let edit = UIImage(systemName: "square.and.pencil")
        }
    }
    
    enum Size {
        static let width = UIScreen.main.bounds.width
    }
}
