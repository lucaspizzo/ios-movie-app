//
//  ShowCell.swift
//  some-shows
//
//  Created by Lucas on 16/03/19.
//  Copyright © 2019 Lucas Pizzo. All rights reserved.
//

import UIKit

class TvShowCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var category: UILabel!
    
    var tvShow: TvShow!
    

    func configureCell(tvShow: TvShow) {
        self.tvShow = tvShow
        self.name.text = tvShow.name
        self.name.adjustsFontForContentSizeCategory = true
        self.name.lineBreakMode = .byTruncatingMiddle
        self.name.numberOfLines = 3
        
        
        self.category.text = tvShow.category
        self.thumbImg.loadURL(url: tvShow.imageUrl)
    }
    
    
}
