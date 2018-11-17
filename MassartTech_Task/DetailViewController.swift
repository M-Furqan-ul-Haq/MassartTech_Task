//
//  DetailViewController.swift
//  MassartTech_Task
//
//  Created by FURQAN on 11/17/18.
//  Copyright © 2018 FURQAN. All rights reserved.
//
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var postId = " "
    var userId = " "
    var titleLbl = " "
    var body = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Post Data"
        
        postIdLabel.text = postId
        userIdLabel.text = userId
        titleLabel.text = titleLbl
        bodyLabel.text = body
        
    }
    
}
