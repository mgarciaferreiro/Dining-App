//
//  TableViewCell.swift
//  Penn Dining App
//
//  Created by Marta García Ferreiro on 9/22/18.
//  Copyright © 2018 Marta García Ferreiro. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var diningImage: UIImageView!
    @IBOutlet var openclosedLabel: UILabel!
    @IBOutlet var openHoursLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
