//
//  ViewController.swift
//  some-shows
//
//  Created by Lucas on 16/03/19.
//  Copyright © 2019 Lucas Pizzo. All rights reserved.
//

import UIKit

class TvSerieVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collection: UICollectionView!
    
    var shows: Array<TvShow> = []
    
    
    private let segues = Segues()
    private let showService = ShowService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HOME"
        self.navigationItem.title = "HOME"
        
        collection.delegate = self
        collection.dataSource = self
        self.dismiss(animated:true, completion: nil)
        self.listShows()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = self.shows[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TvShowCell", for: indexPath) as? TvShowCell {
            cell.configureCell(tvShow: row)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: self.segues.DetailShowSegue, sender:  self.shows[indexPath.row])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 160)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.segues.DetailShowSegue {
            if let tvSerieDetailVC = segue.destination as? TvSerieDetailVC {
                if let serie = sender as? TvShow {
                    tvSerieDetailVC.tvShow = serie
                }
            }
        }
    }
    
    func listShows() {
        showService.listShow(){ (tvShows, error) in
            if let tvShows = tvShows {
                self.shows = tvShows
                self.collection.reloadData()
            }
        }
    }
}

