//
//  TableViewCell.swift
//  MassartTech_Task
//
//  Created by FURQAN on 11/17/18.
//  Copyright © 2018 FURQAN. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cell_id: UILabel!
    @IBOutlet weak var cell_label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
