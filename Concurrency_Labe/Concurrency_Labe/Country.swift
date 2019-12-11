//
//  Country.swift
//  Concurrency_Labe
//
//  Created by Gregory Keeley on 12/11/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let alpha2code: String
    let capital: String
    let population: Int
}
