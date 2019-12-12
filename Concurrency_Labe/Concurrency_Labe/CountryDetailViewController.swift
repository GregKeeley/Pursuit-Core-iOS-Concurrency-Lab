//
//  CountryDetailViewController.swift
//  Concurrency_Labe
//
//  Created by Gregory Keeley on 12/11/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {

    @IBOutlet weak var countryPopulation: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    
    var countryDetail: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    func loadData() {
        guard let country = countryDetail else {
            fatalError("error")
        }
        navigationItem.title = country.name
        countryPopulation.text = ("Population: \(country.population.description)")
        countryCapital.text = country.capital
         let imageURL = "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png"
        
         ImageClient.fetchImage(for: imageURL ) { (result) in
             switch result {
             case .failure(let error):
                 print("error: \(error)")
             case .success(let image):
                 DispatchQueue.main.async {
                     self.countryFlag.image = image
                 }
             }
         }
    }
}
