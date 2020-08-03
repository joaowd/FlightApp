//
//  AirportsViewController.swift
//  FlightApp
//
//  Created by João Palma on 31/07/2020.
//  Copyright © 2020 João Palma. All rights reserved.
//


import UIKit
import LBTATools
import Foundation

class AirportsViewController : BaseViewController<AirportsViewModel>, UISearchControllerDelegate {
    private let searchController = CustomSearchController()
    private let tableView = UITableView()
    private lazy var dataSourceProvider = AirportDataSource(tableView: tableView)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Airports"
        _setupView()
    }
    
    private func _setupView() {
        _configureSearchController()
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.anchor(top: self.view.topAnchor, leading: self.view.safeAreaLayoutGuide.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.safeAreaLayoutGuide.trailingAnchor)
        
        tableView.dataSource = dataSourceProvider
        tableView.delegate = dataSourceProvider
        
        viewModel.airports.data.addObserver(self, completionHandler: {
            self.dataSourceProvider.airports = self.viewModel.airports.data.value
        })
    }
    
    private func _configureSearchController() {
        let searchController = CustomSearchController()
        searchController.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.searchController!.searchBar.setSearch("Search")
    }
}


