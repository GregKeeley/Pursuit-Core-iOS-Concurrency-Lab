//
//  CountryAPICliet.swift
//  Concurrency_Labe
//
//  Created by Gregory Keeley on 12/11/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct CountryAPI {
    static func fetchCountry(completion: @escaping (Result<[Country], AppError>) -> ()) {
        
        let countryEndpointURL = "https://restcountries.eu/rest/v2/name/united"
        guard let url = URL(string: countryEndpointURL) else {
            completion(.failure(.badURL(countryEndpointURL)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let country = try
                        JSONDecoder().decode([Country].self, from: data)
                    completion(.success(country))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
