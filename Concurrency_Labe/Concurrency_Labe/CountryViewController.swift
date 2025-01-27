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
    @IBOutlet weak var searchBar: UISearchBar!
    var countries = [Country]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var searchQuery = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        searchBar.delegate = self
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
    func searchCountries(searchText: String) {
        guard !searchText.isEmpty else { return }
        CountryAPI.fetchCountry { (result) in
            switch result {
            case .failure(let appError):
                print("Error: \(appError)")
            case .success(let countries):
                self.countries = countries.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? CountryDetailViewController,
        let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Could not retrieve an instance of CountryDetailViewController")
        }
        let country = countries[indexPath.row]
        detailVC.countryDetail = country
    }
}
extension CountryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? CountryCell else {
            fatalError("failed to dequeue countryCell")
        }
        let country = countries[indexPath.row]
        
        cell.configureCell(for: country)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
}
extension CountryViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchCountries(searchText: searchText)
        searchBar.resignFirstResponder()
    }
}

