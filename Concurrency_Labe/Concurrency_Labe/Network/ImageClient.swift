//
//  ImageClient.swift
//  Concurrency_Labe
//
//  Created by Gregory Keeley on 12/11/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import Foundation

struct ImageClient {
    static func fetchImage(for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            print("bad url \(url)")
            return
        }
        let dataTask = NetworkHelper.shared.performDataTask(with: url) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
                return
            }
            if let data = data {
                let image = UIImage?(data: data)
            }
        }
    }
}
