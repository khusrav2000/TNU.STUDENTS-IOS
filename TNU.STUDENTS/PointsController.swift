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
    
    private let networkClient = NetworkingClient()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var semActiveID: Int? = nil
    
    override func viewDidLoad() {
        print("Points")

        view.setGradientBakcground(colorStart: Colors.gradStart, colorCenter: Colors.gradCenter, colorEnd: Colors.gradEnd)
        
        coursesList.delegate = self
        coursesList.dataSource = self
        coursesList.backgroundColor = .clear
        //coursesList.separatorInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        //coursesList.estimatedRowHeight = 100
        
        /*let cn: Int = Shared.shared.semesterId ?? -1
        print(cn)*/
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDate), name: NSNotification.Name("UpdateCourses"), object: nil)
        
        for i in StudentData.semesters ?? [] {
            if i.isActive ?? false {
                semActiveID = i.ID
            }
        }
        
    }
    
    @objc func updateDate(){
        print("Update")
        var semNowId: Int? = nil
        for i in StudentData.semesters ?? [] {
            if i.isActive ?? false {
                semNowId = i.ID
            }
        }
        
        if semNowId != semActiveID {
            updateCourses(semesterId: semNowId)
        }
        
    }
    
    func updateCourses(semesterId: Int?){
        coursesList.isHidden = true
        
        if semesterId != nil {
            semActiveID = semesterId
            let token = UserDefaults.standard.string(forKey: "token")!
            
            networkClient.getCoursesBySemester(token: token, semesterId: semesterId!) { (result, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let courses = result {
                    StudentData.courses = courses
                    self.updateTable()
                }
            }
        }
    }
    
    func updateTable(){
        coursesList.reloadData()
        coursesList.isHidden = false
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
    
    var position: Int?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        position = indexPath.section
        print("in sec \(String(describing: position))")
        
        //dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "openCoursePoints", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openCoursePoints") {
            let coursPo = segue.destination as! CoursePointsController
            coursPo.position = position
        }
    }
    
    
   
    @IBAction func showSelectSemster(_ sender: UIButton) {
        
        //performSegue(withIdentifier: "selectSemester", sender: nil)
        
        /*let vc = self.storyboard?.instantiateViewController(withIdentifier: "selectSemesterStoryboard") as! SelectSemesterController
        
        //let vc = UIViewController()
        //vc.preferredContentSize = CGSize(width: 100, height: 50)
    
        
        vc.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = vc.popoverPresentationController!
        
        //popover.barButtonItem = sender
        //popover.sourceRect = sender.bounds
        //popover.permittedArrowDirections = [.down, .up]
        popover.sourceView = view
        present(vc, animated: true, completion: nil)*/
        
        
        /*let sortOrderDescendingOptionItem = SortOrderOptionItem(text: "Descending", font: UIFont.systemFont(ofSize: 13), isSelected: true, orderType: .descending)
        let sortOrderAscendingOptionItem = SortOrderOptionItem(text: "Ascending", font: UIFont.systemFont(ofSize: 13), isSelected: false, orderType: .ascending)
        
        let items: [[RBOptionItem]] = [[sortOrderDescendingOptionItem, sortOrderAscendingOptionItem]]
         
        let optionItemListVC = RBOptionItemListViewController()
        optionItemListVC.items = items
        
        guard let popoverPresentationController = optionItemListVC.popoverPresentationController else { fatalError("Set Modal presentation style") }
        //popoverPresentationController.barButtonItem = barButtonItem
        popoverPresentationController.delegate = self
        self.present(optionItemListVC, animated: true, completion: nil)*/
        
        
    }
    
}


