//
//  ViewController.swift
//  TableViewUsingBackDataPassing
//
//  Created by Mac on 27/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    var students : [Student] = [Student]()
    var secondViewController : SecondViewController = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentTableView.dataSource = self
        studentTableView.delegate = self
        rgisterXib()
    }
    func rgisterXib(){
let nibName = UINib(nibName: "StudentTableViewCell", bundle: nil)
    studentTableView.register(nibName, forCellReuseIdentifier: "StudentTableViewCell")
    }

    
    @IBAction func plusbtn(_ sender: Any) {
       let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.studentBackDataPassingDelegate = self
        
        navigationController?.pushViewController(secondViewController, animated: true)
        }
    }

extension ViewController : StudentInfoPassingProtocol{
    func backDataPassing(student : Student){
        
        students.append(student)
        studentTableView.reloadData()}
    
}
extension ViewController : UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            students.count
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath) as! StudentTableViewCell
            
            var eachObjectOfStudent = students[indexPath.row]
studentTableViewCell.firstNameLabel.text = eachObjectOfStudent.firstName
studentTableViewCell.lastNameLabel.text = eachObjectOfStudent.lastName
studentTableViewCell.rollNumberLabel.text = String(eachObjectOfStudent.rollNumber)
            return studentTableViewCell ?? UITableViewCell()
        }
    
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130.0
    }
    
}

