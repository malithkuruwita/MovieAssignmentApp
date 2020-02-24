//
//  Service.swift
//  MovieAssignmentApp
//
//  Created by Malith on 2/24/20.
//  Copyright © 2020 Malith. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    var movies = [Movies]()
    
    //fetch data from api
    func fetchMovies(completion: @escaping ([Movies]?, Error?) -> ()) {
        let urlString = "http://www.omdbapi.com/?apikey=9a398970&s=batman"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch movies:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let moviesObject = try JSONDecoder().decode(Movie.self, from: data)
                self.movies = moviesObject.Search
                DispatchQueue.main.async {
                    completion(self.movies, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}

