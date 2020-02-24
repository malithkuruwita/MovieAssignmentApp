//
//  MovieListViewControllerExtension.swift
//  MovieAssignmentApp
//
//  Created by Malith on 2/24/20.
//  Copyright © 2020 Malith. All rights reserved.
//

import Foundation
import UIKit

extension MovieListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell") as! MovieListTableViewCell
        

        cell.title.text = movies[indexPath.row].Title
        cell.year.text = movies[indexPath.row].Year
        let img = movies[indexPath.row].Poster
        
        
        //load image to image view and cache it
        imageService.getImage(withURL: img){
         image in
            cell.moviePoster.image = image
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
