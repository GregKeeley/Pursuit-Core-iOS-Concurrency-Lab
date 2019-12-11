//
//  ViewController.swift
//  Concurrency_Labe
//
//  Created by Gregory Keeley on 12/11/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var countries = [Country]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
        
        func loadData() {
            CountryAPI.fetchCountry(completion: { (result) in
                switch result {
                case .failure(let appError):
                    print("error: \(appError)")
                case .success(let countries):
                    self.countries = countries
                }
            })
        }

}

