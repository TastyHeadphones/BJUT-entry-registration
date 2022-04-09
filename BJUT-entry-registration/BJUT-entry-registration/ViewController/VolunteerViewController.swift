//
//  VolunteerViewController.swift
//  BJUT-entry-registration
//
//  Created by Magic Keegan on 4/8/22.
//

import UIKit

class VolunteerViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Student.shared.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let student = Student.shared[indexPath.row]
        cell.textLabel?.text = "\(student.name) \(student.id)"
        
        return cell
    }
    

    @IBOutlet var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func uploadData(_ sender:UIButton){
        spinner.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) {[weak self] _ in
            Student.shared.removeAll()
            DispatchQueue.main.async {
                self?.spinner.stopAnimating()
                self?.tableView.reloadData()
            }
            
            
        }
        
    }

  

}
