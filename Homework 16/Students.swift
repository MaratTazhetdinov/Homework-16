//
//  Students.swift
//  Homework 16
//
//  Created by Marat Tazhetdinov on 08.08.2021.
//

import UIKit

class Students {
    
    let name: String
    
    let avgMark: Double = Double.random(in: 2...5)
    
    init(name: String) {
        self.name = name
    }
}
