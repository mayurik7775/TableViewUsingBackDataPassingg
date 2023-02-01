//
//  SecondViewController.swift
//  TableViewUsingBackDataPassing
//
//  Created by Mac on 27/01/23.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var firstNameTexttField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var rollNumberTextField: UITextField!
    
    var firstName : String = ""
    var lastName : String = ""
    var rollNumber : String = ""
    var studentObject : Student?
    
    var studentBackDataPassingDelegate : StudentInfoPassingProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    @IBAction func btnClickToNavigateFVC(_ sender: Any) {
        guard let studentBackDataPassingDelegate = studentBackDataPassingDelegate else {
            return
        }
        firstName = firstNameTexttField.text!
        lastName = lastNameTextField.text!
        rollNumber = rollNumberTextField.text!
        
        studentObject = Student(firstName: firstName, lastName: lastName, rollNumber: rollNumber)
        
        studentBackDataPassingDelegate.backDataPassing(student: studentObject!)
        
        self.navigationController?.popViewController(animated: true)
        

    }
}
