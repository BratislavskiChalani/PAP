//
//  ChooseTableViewCell.swift
//  PAP
//
//  Created by Jakub Ďurech on 12.4.2016.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import UIKit

class ChooseTableViewCell: UITableViewCell {

    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
