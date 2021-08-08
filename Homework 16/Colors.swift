//
//  Colors.swift
//  Homework 16
//
//  Created by Marat Tazhetdinov on 08.08.2021.
//

import UIKit

class Colors {
    
    let randomRed: Int = Int.random(in: 0...255)
    let randomGreen: Int = Int.random(in: 0...255)
    let randomBlue: Int = Int.random(in: 0...255)
    
    let color: UIColor
    
    init() {
        color = UIColor.init(displayP3Red: CGFloat(randomRed)/255,
                             green: CGFloat(randomGreen)/255,
                             blue: CGFloat(randomBlue)/255,
                             alpha: 1.0)
    }
}
