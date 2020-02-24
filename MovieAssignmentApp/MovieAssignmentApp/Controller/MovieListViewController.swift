//
//  MovieListViewController.swift
//  MovieAssignmentApp
//
//  Created by Malith on 2/24/20.
//  Copyright © 2020 Malith. All rights reserved.
//

import UIKit


class MovieListViewController: UIViewController {

    var movies = [Movies]()
    
    @IBOutlet weak var tableView: UITableView!
    
    var refreshController: UIRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get json data
        fetchData()
        
        //add refresh controller
        tableView.addSubview(refreshController)
        refreshController.tintColor = UIColor.green
        refreshController.backgroundColor = UIColor.darkGray
        refreshController.attributedTitle = NSAttributedString(string: "Fetching more data...", attributes: [NSAttributedStringKey.foregroundColor : refreshController.tintColor])
        
        refreshController.addTarget(self, action: #selector(MovieListViewController.fetchData) , for: UIControlEvents.valueChanged)
    }

    @objc fileprivate func fetchData() {
        Service.shared.fetchMovies { (movies, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            guard let movies = movies else {return}
            self.movies = movies
            
            //reload table view in main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("refreshed")
            self.refreshController.endRefreshing()
        }
        
    }
    

    
    
    
    @IBAction func signOut(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Authentication", bundle: nil)
        let ViewController = storyBoard.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
        self.present(ViewController, animated: true, completion: nil)
    }
    
    
    
    //nav bar styles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.white
        nav?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.green]
    }

    

}
