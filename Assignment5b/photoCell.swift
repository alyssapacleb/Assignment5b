//
//  photoCell.swift
//  Assignment5b
//
//  Created by Pacleb, Alyssa June N on 3/7/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

class photoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var imageCaption: UILabel!
    
    func displayContent(image: UIImage, caption: String){
        imageView.image = image
        imageCaption.text = caption
    }
}
