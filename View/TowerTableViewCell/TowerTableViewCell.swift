//
//  TowerTableViewCell.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/7/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class TowerTableViewCell: UITableViewCell {
    @IBOutlet weak var TowerNameLbl: UILabel!
    @IBOutlet weak var OwnerMobileLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
