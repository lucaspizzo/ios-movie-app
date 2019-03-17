//
//  TvSerieDetailVC.swift
//  some-shows
//
//  Created by Lucas on 16/03/19.
//  Copyright © 2019 Lucas Pizzo. All rights reserved.
//

import UIKit

class TvSerieDetailVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView?
    
    @IBOutlet weak var categoryLbl: UILabel?
    
    @IBOutlet weak var releaseLbl: UILabel?
    
    @IBOutlet weak var descriptionLbl: UITextView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var defaults = Defaults()
    
    var tvShow: TvShow?
    
    @IBAction func showDetail(_ sender: Any) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: (categoryLbl?.frame.origin.y)!), animated: true)

    }
    
    @IBAction func showImage(_ sender: Any) {
        self.scrollView.setContentOffset(CGPoint(x: 0, y: (backgroundImage?.frame.origin.y)!), animated: true)
    }
    
    override func viewDidLoad() {
        self.title = self.tvShow?.name
        backgroundImage?.loadURL(url: self.tvShow?.imageUrl ?? defaults.imageUrl )
        
        self.categoryLbl?.text = self.tvShow?.category.uppercased()
        self.categoryLbl?.textColor = UIColor.white
        self.categoryLbl?.textAlignment = NSTextAlignment.center
        
        self.releaseLbl?.text = self.tvShow?.date
        self.descriptionLbl?.text = self.tvShow?.description
        
        
        self.dismiss(animated:true, completion: nil)
    }
    
}
