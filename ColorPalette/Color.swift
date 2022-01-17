//
//  Color.swift
//  ColorPalette
//
//  Created by 이민지 on 2022/01/17.
//

import UIKit

struct Color {
    var colorName: String
    
    var image: UIImage? {
        return UIImage(named: "\(colorName).jpg")
    }
    
    init(colorName: String) {
        self.colorName = colorName
    }
}
