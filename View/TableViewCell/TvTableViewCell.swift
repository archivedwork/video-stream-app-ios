//
//  TvTableViewCell.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 4/29/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class TvTableViewCell: UITableViewCell {

    @IBOutlet weak var TvImage: UIImageView!
    @IBOutlet weak var TvLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTableData(text: String, image: UIImage){
        
        self.TvLbl.text = text
        self.TvImage.image = image
    }
    
}
