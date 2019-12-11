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
    
    var country: Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    func loadData() {
        navigationItem.title = country?.name
        countryPopulation.text = country?.capital.description
        countryCapital.text = country?.capital
    }
}
