//
//  PackagesCell.swift
//  Baghdad-Link
//
//  Created by Mohammed Jamal on 5/1/18.
//  Copyright © 2018 Mohammed Jamal. All rights reserved.
//

import UIKit

class PackagesCell: UICollectionViewCell {
    @IBOutlet weak var PackageImage: UIImageView!
    
    
    
    
    func setData(image: UIImage){
        
        self.PackageImage.image = image
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
