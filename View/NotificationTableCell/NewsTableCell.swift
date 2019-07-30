//
//  NewsTableCell.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/12/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class NewsTableCell: UITableViewCell {

    @IBOutlet weak var TitleLbl: UILabel!
    @IBOutlet weak var DatetimeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
