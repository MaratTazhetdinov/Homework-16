//
//  ViewController.swift
//  Homework 16
//
//  Created by Marat Tazhetdinov on 08.08.2021.
//

import UIKit

class RGBViewController: UIViewController {

    @IBOutlet weak var RGBTableView: UITableView!
    
    var colorsArray: [Colors] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createColorsData()
        RGBTableView.dataSource = self
        RGBTableView.delegate = self
    }
    
    func createColorsData () {
        for _ in 0...199 {
            let color: Colors = Colors()
            colorsArray.append(color)
        }
    }

}

extension RGBViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RGBViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRGB", for: indexPath)
        cell.textLabel?.text = "RGB (\(colorsArray[indexPath.row].randomRed), \(colorsArray[indexPath.row].randomGreen), \(colorsArray[indexPath.row].randomBlue))"
        cell.textLabel?.textColor = .init(colorsArray[indexPath.row].color)
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
}

