//
//  ViewController.swift
//  MassartTech_Task
//
//  Created by FURQAN on 11/17/18.
//  Copyright © 2018 FURQAN. All rights reserved.
//

import UIKit

var myindex = 0
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0{
            let idLabel = UILabel(frame: CGRect(x: 20, y: 5, width: 50, height: 50))
            idLabel.text = "Id"
            let titleLabel = UILabel(frame: CGRect(x: 20, y: 5, width: view.frame.width-30, height: 50))
            titleLabel.text = "Title"
            titleLabel.textAlignment = .center
            cell.addSubview(titleLabel)
            cell.addSubview(idLabel)
        }else{
            cell.textLabel?.text = "\(indexPath.row)"
        }
        
        
        return (cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myindex = indexPath.row
        
        if myindex == 0{
            // Do Nothing
        }else if myindex == 3{
            // Show Alert
            let alert = UIAlertController(title: "Warning", message: "Post is Locked. Please pay to unlock.", preferredStyle: .alert)
            let action = UIAlertAction (title: "OK", style: .default) { (UIAlertAction) in
            }
            alert.addAction(action)
            present ( alert ,  animated : true , completion : nil )
        }else{
            performSegue(withIdentifier: "segue", sender: self)
        }
        
    }
    
}

