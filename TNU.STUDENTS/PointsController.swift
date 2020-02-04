//
//  PointsController.swift
//  TNU.STUDENTS
//
//  Created by mac on 2/4/20.
//  Copyright © 2020 Istiqlol Soft. All rights reserved.
//

import Foundation
import UIKit

class PointsController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        print("Points")

        view.setGradientBakcground(colorStart: Colors.gradStart, colorCenter: Colors.gradCenter, colorEnd: Colors.gradEnd)
        
        
        
    }
}
