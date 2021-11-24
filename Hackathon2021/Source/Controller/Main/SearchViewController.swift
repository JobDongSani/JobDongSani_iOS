//
//  SearchViewController.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import UIKit

class SearchViewController : BaseVc{
    
    override func configure() {
        super.configure()
        searchSetting()
        navigationController?.navigationBar.isHidden = false
        let searchbar = UISearchBar()
        searchbar.placeholder = "SearchUser"
        self.navigationItem.titleView = searchbar
        addView()
        location()
    }
    private func searchSetting(){
        let searchController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchController
    }
    private func addView(){
    }
    private func location(){

    }
}

