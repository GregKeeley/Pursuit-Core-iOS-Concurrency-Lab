//
//  CountryCell.swift
//  Concurrency_Labe
//
//  Created by Gregory Keeley on 12/11/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    

    
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    @IBOutlet weak var countryPopulation: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!

    func configureCell(for country: Country) {
        
        countryName.text = country.name
        countryCapital.text = country.capital
        countryPopulation.text = ("Population: \(country.population.description)")
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
