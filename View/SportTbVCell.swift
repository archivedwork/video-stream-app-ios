//
//  SportTbVCell.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/20/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class SportTbVCell: UITableViewCell {
    @IBOutlet weak var Imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(image: UIImage){
        
        self.Imageview.image = image
    }

}
