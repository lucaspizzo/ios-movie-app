//
//  Show.swift
//  some-shows
//
//  Created by Lucas on 16/03/19.
//  Copyright © 2019 Lucas Pizzo. All rights reserved.
//
import Foundation
import UIKit

class TvShow {
    
    private var _name: String!
    private var _category: String!
    private var _imageUrl: URL!
    private var _date: String!
    private var _description: String!

    var name: String {
        return _name
    }
    
    var category: String {
        return _category
    }
    
    var imageUrl: URL {
        return _imageUrl
    }
    
    var date: String {
        return _date
    }
    
    var description: String {
        return _description
    }
    
    init(name: String, category: String, imageUrl: URL, date: String, description: String) {
        self._name = name
        self._category = category
        self._imageUrl = imageUrl
        self._description = description
        self._date = date
    }
    
    convenience init(name: String, category: String, imageUrl: String, date: String, description: String) {
        self.init(name: name, category: category, imageUrl: URL(string: imageUrl) ?? URL(string: "http://")!, date: date, description: description)
    }
    
    convenience init(tvShowResponse: TvShowResponse) {
        let category: String = tvShowResponse.show.genres.count > 0 ? tvShowResponse.show.genres[0] : "No Category"
        let image: String = tvShowResponse.show.image != nil  ? (tvShowResponse.show.image?.medium)! : ""
        self.init(name: tvShowResponse.show.name, category: category, imageUrl: image, date: tvShowResponse.show.premiered ?? "", description: tvShowResponse.show.summary)
    }
    
}

extension Collection where Indices.Iterator.Element == Index {
    subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
