//
//  TableViewCellComments.swift
//  MassartTech_Task
//
//  Created by FURQAN on 11/17/18.
//  Copyright © 2018 FURQAN. All rights reserved.
//

import UIKit

class TableViewCellComments: UITableViewCell {
    
    @IBOutlet weak var commentPostId: UILabel!
    @IBOutlet weak var commentUserId: UILabel!
    @IBOutlet weak var commentName: UILabel!
    @IBOutlet weak var commentEmail: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

