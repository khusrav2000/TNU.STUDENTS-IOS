//
//  CourseWeekPointsController.swift
//  TNU.STUDENTS
//
//  Created by mac on 2/18/20.
//  Copyright © 2020 Istiqlol Soft. All rights reserved.
//

import Foundation
import UIKit

class CourseWeekPointsController: UITableViewController {
    
    var position: Int? = nil
    
    var course: Course? = nil
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        course = StudentData.selectedCourse
        navigationController?.navigationBar.topItem?.title = course?.SubjectName?.RU
        navigationController?.navigationBar.barTintColor = Colors.weekPointsNavigationBar
        navigationController?.navigationBar.topItem?.rightBarButtonItem?.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        tableView.backgroundColor = Colors.weekPointsBackground
        
        
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        print(4)
        return 4
    }
       
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return course?.FirstRatingWeeks?.count ?? 0
        } else if section == 1 {
            return course?.SecondRatingWeeks?.count ?? 0
        } else {
            return 0
        }
    }
       
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
       
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50.0))
        headerView.backgroundColor = .clear
        let width = UIScreen.main.bounds.width
        let name = UILabel(frame: CGRect(x: 10, y: 10, width: 200, height: 30))
        let point = UILabel(frame: CGRect(x: width - 100, y: 10, width: 90, height: 30))
        point.textAlignment = NSTextAlignment.right
           
        name.textColor = Colors.specialGrey
        point.textColor = .lightGray
           
        let lang = UserDefaults.standard.string(forKey: "AppLanguage")
        
        if section == 0 {
            name.text = "РЕЙТИНГ 1"
            point.text = String(course?.FirstRatingPoint ?? 0.0)
        } else if section == 1 {
            name.text = "РЕЙТИНГ 2"
            point.text = String(course?.SecondRatingPoint ?? 0.0)
        } else if section == 2 {
            if lang == "ru" {
                name.text = "ЭКЗАМЕН"
            } else {
                name.text = "ИМТИҲОН"
            }
            point.text = String(course?.ExamPoint ?? 0.0)
        } else if section == 3 {
            if lang == "ru" {
                name.text = "БАЛЛ / ОЦЕНКА"
            } else {
                name.text = "ХОЛИ / БАҲОИ НИҲОИ"
            }
            point.text = String(course?.TotalPoint ?? 0.0)
        }
        headerView.addSubview(name)
        headerView.addSubview(point)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 49, width: width, height: 1))
        lineView.backgroundColor = .gray
        headerView.backgroundColor = Colors.weekPointsBackground
        headerView.addSubview(lineView)
        
        return headerView
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekPointCell", for: indexPath) as! WeekPointCell
           
        cell.backgroundColor = .clear
        let row = indexPath.row
        let section = indexPath.section
        
        var weekName = "Ҳафтаи"
        let lang = UserDefaults.standard.string(forKey: "AppLanguage")
        if lang == "ru"{
            weekName = "Неделя"
        }
        
        if section == 0 {
            cell.setValues(name: "\(weekName) \(String(course?.FirstRatingWeeks?[row].WeekNumber ?? 0))", point: course?.FirstRatingWeeks?[row].Point)
        } else {
            cell.setValues(name: "\(weekName) \(String(course?.SecondRatingWeeks?[row].WeekNumber ?? 0))", point: course?.SecondRatingWeeks?[row].Point)
        }
           
        return cell
    }
}
