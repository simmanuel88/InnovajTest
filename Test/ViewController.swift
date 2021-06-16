//
//  ViewController.swift
//  Test
//
//  Created by Immanuel Infant Raj S on 16/06/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {
    
    let studentsDictionary = [
        ["name":"Joel", "email":"joel@gmail.com", "phone":"+351 910 209 567","image":"ChadCunningham.jpg"],
        ["name":"Samuel", "email":"samuel@gmail.com", "phone":"+351 910 209 568","image":"KurtSimmmons.jpg"],
        ["name":"Annie", "email":"annie@gmail.com", "phone":"+351 910 209 569","image":"StaceyWhite.jpg"]] as [Any]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "Default"
        let cell:UITableViewCell =  tableView.dequeueReusableCell(withIdentifier: identifier)! as UITableViewCell
        let currentStudent = studentsDictionary[indexPath.row] as! NSDictionary
        cell.textLabel?.text = currentStudent["name"] as? String
        cell.detailTextLabel?.text = currentStudent["email"] as? String
        cell.imageView?.image = UIImage(named: currentStudent["image"] as! String)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentStudent = studentsDictionary[indexPath.row] as! NSDictionary
        let studentname = currentStudent["name"] as! String
        let phoneNumber = currentStudent["phone"] as? String
        let alert = UIAlertController(title: "Do you want to call " + studentname, message: phoneNumber, preferredStyle: UIAlertController.Style.alert)
        let callAction = UIAlertAction(title: "Call", style: .default, handler: { action in
            if let url = URL(string: "tel://\(String(describing: phoneNumber))"),
                    UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
               })
        alert.addAction(callAction)
        alert.addAction(cancelAction)

        self.present(alert, animated: true, completion: nil)
        
    }
    

    @IBOutlet weak var tblViewLoadStudents: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tblViewLoadStudents.delegate = self
        self.tblViewLoadStudents.dataSource = self
        self.tblViewLoadStudents.rowHeight = 60.0
    }


}

