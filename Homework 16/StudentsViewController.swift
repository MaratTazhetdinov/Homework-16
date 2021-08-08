//
//  StudentsViewController.swift
//  Homework 16
//
//  Created by Marat Tazhetdinov on 08.08.2021.
//

import UIKit

class StudentsViewController: UIViewController {

    @IBOutlet weak var studentsTableView: UITableView!
    
    let names: [String] = ["Hayden Andersen",
                           "Isabella-Rose Piper",
                           "Kendal Hardy",
                           "Roshan Mcintyre",
                           "Valerie Mohammed",
                           "Bryce Price",
                           "Dolores Townsend",
                           "Elsie-May Padilla",
                           "Nida Sparrow",
                           "Divine Wilkinson",
                           "Gino Kelly",
                           "Humzah Vega",
                           "Ellie-Rose Dudley",
                           "Abubakar Ritter",
                           "Akeem Contreras",
                           "Dua Woodcock",
                           "Matthias Wyatt",
                           "Hoorain Wheeler",
                           "Derren Randall",
                           "Baran Crouch",
                           "Jaydan Preece",
                           "Freja Humphreys",
                           "Lance Jaramillo",
                           "Hollie Tomlinson",
                           "Shayan Cross",
                           "Ehsan Wormald",
                           "Bethaney Colley",
                           "Ria Cordova",
                           "Anthony Winters",
                           "Rory Diaz"
    ]
    
    var listOfStudents: [Students] = []
    
    var sortedStudents = [Dictionary<String, Any>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStudentsInfo()
        listOfStudents = listOfStudents.sorted(by: {$0.name < $1.name})
        studentsTableView.dataSource = self
        studentsTableView.register(UINib(nibName: "TableViewCell", bundle: nil),
                           forCellReuseIdentifier: "TableViewCell")
        setSortedStudents()
    }
    
    func setStudentsInfo () {
        for index in 0...29 {
            let student: Students = Students(name: names[index])
            listOfStudents.append(student)
        }
    }
    
    func setSortedStudents() {
        sortedStudents.append(["title": "A students", "value": listOfStudents.filter({$0.avgMark >= 4.5})])
        sortedStudents.append(["title": "B students", "value": listOfStudents.filter({$0.avgMark > 4.00 && $0.avgMark<4.5})])
        sortedStudents.append(["title": "C students", "value": listOfStudents.filter({$0.avgMark > 3.00 && $0.avgMark<4.0})])
        sortedStudents.append(["title": "D students", "value": listOfStudents.filter({$0.avgMark < 3.00})])
    }
}

extension StudentsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedStudents.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "A students"
        case 1:
            return "B students"
        case 2:
            return "C students"
        case 3:
            return "D students"
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let students = sortedStudents[section]["value"] as? [Students] else {
            return 0
        }
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        guard let students = sortedStudents[indexPath.section]["value"] as? [Students] else {
            return cell
        }
        cell.setLabels(name: students[indexPath.row].name, avgMark: students[indexPath.row].avgMark)
        return cell
    }
    
}
