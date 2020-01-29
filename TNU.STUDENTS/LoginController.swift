//
//  LoginController.swift
//  TNU.STUDENTS
//
//  Created by mac on 1/26/20.
//  Copyright © 2020 Istiqlol Soft. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboard() {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
    
}

class LoginController: UIViewController {

    @IBOutlet var loginView: UIView!
    @IBOutlet weak var universityName: UILabel!

    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.setGradientBakcground(colorStart: Colors.gradStart, colorCenter: Colors.gradCenter, colorEnd: Colors.gradEnd)
        
        let loginImage = UIImage(named: "login")
        addLeftImageTo(txtField: loginText, andImage: loginImage! )
        
        let passwordImage = UIImage(named: "password")
        addLeftImageTo(txtField: passwordText, andImage: passwordImage! )
        
        self.hideKeyboard()
        
        loginText.becomeFirstResponder()
        
        addBottomBorder(txtField: loginText)
        addBottomBorder(txtField: passwordText)
        
        setPlaceholderColor(txtField: loginText, color: Colors.lineColor)
        setPlaceholderColor(txtField: passwordText, color: Colors.lineColor)
        
        loginButton.layer.cornerRadius = 30
        
        setLetterSpacing(text: universityName, value: 5.0)
        setLineSpacing(text: universityName, value: 8.0)
      
    }
    
    func setLetterSpacing(text: UILabel, value: Double){
        let attributedString = text.attributedText as! NSMutableAttributedString
        attributedString.addAttribute(NSAttributedString.Key.kern, value: value, range: NSMakeRange(0, attributedString.length))
        
        text.attributedText = attributedString
    }
    
    func setLineSpacing(text: UILabel, value: Double){
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(value)
        
        let attrString = text.attributedText as! NSMutableAttributedString
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        
        text.attributedText = attrString
        text.textAlignment = NSTextAlignment.center
        
    }
    
    
    
    func setPlaceholderColor(txtField: UITextField, color: UIColor){
        let attribut = NSAttributedString(string: txtField.placeholder!,
                                          attributes: [NSAttributedString.Key.foregroundColor: color])
        txtField.attributedPlaceholder = attribut
    }
    
    
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width,
                                                         height: img.size.height))
           
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
           
    }
    
    func addBottomBorder(txtField: UITextField){
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: -5.0, y: txtField.frame.height , width: txtField.frame.width + 10, height: 2)
        
        bottomLine.backgroundColor = Colors.lineColor.cgColor
        txtField.layer.addSublayer(bottomLine)
        
    }

    
    @IBAction func buttonAction(sender:UIButton!){
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            print("qqq")
            dismiss(animated: true, completion: nil)
            performSegue(withIdentifier: "goMain", sender: self)
        }
    }
    
}

