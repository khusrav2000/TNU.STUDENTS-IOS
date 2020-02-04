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
    
    override func viewDidLoad() {
        print("Prifile")
        view.setGradientBakcground(colorStart: Colors.gradStart, colorCenter: Colors.gradCenter, colorEnd: Colors.gradEnd)
        
        generalInfomation.layer.cornerRadius = 10
        fullName.text = StudentData.studentInfo?.FullName?.TJ!
        studentID.text = StudentData.studentInfo?.RecordBookNumber!
        
    }
    
    @IBAction func logout(_ sender: UIButton) {
        
        UserDefaults.standard.set("", forKey: "token")
        
        //dismiss(animated: true, completion: nil)
        //performSegue(withIdentifier: "logout", sender: self)
    }
    
    
    
}
