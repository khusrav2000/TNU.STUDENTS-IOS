//
//  ProfileController.swift
//  TNU.STUDENTS
//
//  Created by mac on 2/4/20.
//  Copyright © 2020 Istiqlol Soft. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak var generalInfomation: UIView!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var studentID: UILabel!
    @IBOutlet weak var otherInformation: UIScrollView!
    
    @IBOutlet weak var facultyName: UILabel!
    @IBOutlet weak var specialty: UILabel!
    @IBOutlet weak var studyForm: UILabel!
    @IBOutlet weak var educationalLevel: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var entranceYear: UILabel!
    
    override func viewDidLoad() {
        print("Prifile")
        view.setGradientBakcground(colorStart: Colors.gradStart, colorCenter: Colors.gradCenter, colorEnd: Colors.gradEnd)
        
        generalInfomation.layer.cornerRadius = 10
        otherInformation.layer.cornerRadius = 10
        
        let lang: String? = UserDefaults.standard.string(forKey: "AppLanguage")
        let name: String
        
        if lang == "ru"{
            fullName.text = StudentData.studentInfo?.FullName?.RU!
            facultyName.text = StudentData.studentInfo?.Faculty?.RU
            name = StudentData.studentInfo?.Specialty?.RU ?? ""
        } else {
            fullName.text = StudentData.studentInfo?.FullName?.TJ!
            facultyName.text = StudentData.studentInfo?.Faculty?.TJ
            name = StudentData.studentInfo?.Specialty?.TJ ?? ""
        }
        
        studentID.text = StudentData.studentInfo?.RecordBookNumber!
        
        
        
        let code: String = StudentData.studentInfo?.CodeSpecialty ?? ""
        specialty.text = "\(name) (\(code))"
        specialty.sizeToFit()
        //specialty.preferredMaxLayoutWidth = 70
        studyForm.text = StudentData.studentInfo?.TrainingForm
        educationalLevel.text = StudentData.studentInfo?.TrainingLevel
        
        let now: String = String(StudentData.studentInfo?.Course ?? 0)
        let period: String = String(StudentData.studentInfo?.TrainingPeriod ?? 0)
        
        course.text = "\(now) / \(period)"
        
        group.text = StudentData.studentInfo?.Group
        entranceYear.text = StudentData.studentInfo?.YearUniversityEntrance
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        
        UserDefaults.standard.set("", forKey: "token")
        
        dismiss(animated: false, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name("RefreshController"), object: nil)
        
        
        //dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "logout", sender: self)
    }
    
    
    
}
