//
//  ImageClient.swift
//  Concurrency_Labe
//
//  Created by Gregory Keeley on 12/11/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit
struct ImageClient {
    static func fetchImage(for urlString: String, completion: @escaping (Result<UIImage?, Error>) -> ()) {
        guard let url = URL(string: urlString) else {
            fatalError("bad url \(urlString)")
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            if let data = data {
                let image = UIImage(data: data)
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
