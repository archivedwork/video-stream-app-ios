//
//  ItemCell.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 4/29/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var ItemImage: UIImageView!
    @IBOutlet weak var ItemLbl: UILabel!
    
    
    
    
    func setData(text: String, image: UIImage){
        
        self.ItemLbl.text = text
        self.ItemImage.image = image
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
}
