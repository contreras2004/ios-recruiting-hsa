//
//  BaseViewController.swift
//  ConcreteIOsRecruit
//
//  Created by Matías Contreras on 11/19/18.
//  Copyright © 2018 Matias Contreras. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    enum Segues: String{
        case goToMovieDtails
    }
    
    var searchController : UISearchController!
    var message: MessageView? = nil
    var selectedMovie: Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSearchController(withDelegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setUpSearchController(withDelegate: BaseViewController){
        self.definesPresentationContext = true
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        self.navigationItem.searchController = searchController
        
        if let searchController = self.searchController{
            if let delegate = withDelegate as? UISearchControllerDelegate{
                searchController.delegate = delegate
            }
            if let delegate = withDelegate as? UISearchResultsUpdating{
                searchController.searchResultsUpdater = delegate
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieDetailsTableViewController{
            destination.movie = self.selectedMovie
        }
    }
}
