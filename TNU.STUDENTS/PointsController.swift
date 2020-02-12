//
//  PointsController.swift
//  TNU.STUDENTS
//
//  Created by mac on 2/4/20.
//  Copyright © 2020 Istiqlol Soft. All rights reserved.
//

import Foundation
import UIKit

class PointsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var coursesList: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        print("Points")

        view.setGradientBakcground(colorStart: Colors.gradStart, colorCenter: Colors.gradCenter, colorEnd: Colors.gradEnd)
        
        coursesList.delegate = self
        coursesList.dataSource = self
        coursesList.backgroundColor = .clear
        //coursesList.separatorInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        //coursesList.estimatedRowHeight = 100
        
    }
    
    // MARK: UITableViewDelegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        print("ITs work 1")
        print("ravno \(StudentData.courses?.count ?? 0)")
        return StudentData.courses?.count ?? 0
    }
    


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("ITs work 2")
        return 1
    }
    
    /*func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("ITs work 3")
        let cell = tableView.dequeueReusableCell(withIdentifier: "coursesListCells", for: indexPath) as! CourseCell
        
        let row = indexPath.section
        print(row)
        //cell.textLabel?.text = StudentData.courses?[row].SubjectName?.TJ ?? ""
        cell.setCourse(course: StudentData.courses?[row])
        
        cell.layer.cornerRadius = 10
        cell.backgroundColor = Colors.coursesListItem
        
        let customColorView: UIView = UIView()
        customColorView.backgroundColor = Colors.selectedCourseCell
        //customColorView.backgroundColor = .white
        cell.selectedBackgroundView = customColorView
        
        //cell.clipsToBounds = true
        
        //cell.layoutMargins = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
        //cell.separatorInset = UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let position = indexPath.section
        print("in sec \(position)")
        
        //dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "openCoursePoints", sender: self)
    }
    
    
    
    
}
