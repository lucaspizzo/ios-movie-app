//
//  ShowService.swift
//  some-shows
//
//  Created by Lucas on 16/03/19.
//  Copyright © 2019 Lucas Pizzo. All rights reserved.
//

import Foundation

class ShowService {
    
    typealias ListShowResponseCompletion = ([TvShow]?, Error? ) -> Void
    func listShow(completion: @escaping ListShowResponseCompletion) {
        let urlString = "http://api.tvmaze.com/search/shows?q=robot"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from url:", err)
                    return
                }
                
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let response =  self.parseJSON(data: data)
                var shows: [TvShow] = []
                
                for r in response {
                    shows.append(TvShow(tvShowResponse: r))
                }
                completion(shows, nil)
            }
            }.resume()
        
    }
    
    func parseJSON(data: Data) -> [TvShowResponse]{
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([TvShowResponse].self, from: data)
        } catch let error {
            print(error as Any)
        }
        return []
    }
    
}

