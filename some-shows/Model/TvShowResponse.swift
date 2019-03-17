//
//  ShowListResponse.swift
//  some-shows
//
//  Created by Lucas on 16/03/19.
//  Copyright © 2019 Lucas Pizzo. All rights reserved.
//

import Foundation

struct TvShowResponseImage: Decodable {
    let medium: String
    let original: String
}

struct TvShowResponseContent: Decodable {
    let id: Int
    let name: String
    let genres: [String]
    let summary: String
    let premiered: String?
    
    let image: TvShowResponseImage?
}

struct TvShowResponse: Decodable {
    let show: TvShowResponseContent
}
