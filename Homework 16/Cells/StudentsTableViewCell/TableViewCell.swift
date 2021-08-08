//
//  TableViewCell.swift
//  Homework 16
//
//  Created by Marat Tazhetdinov on 08.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avgMarkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLabels(name: String, avgMark: Double) {
        nameLabel.text = "\(name):"
        avgMarkLabel.text = String(format: "%.2f", avgMark)
        nameLabel.textColor = avgMark < 4.0 ? UIColor.red : UIColor.black
    }
}
