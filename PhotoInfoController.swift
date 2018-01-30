//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Andres Gutierrez on 1/30/18.
//  Copyright © 2018 Andres Gutierrez. All rights reserved.
//

import Foundation



func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
    
    let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")!
    
    let query: [String: String] = [
        "api_key": "DEMO_KEY",
        "date": "2018-01-30"
    ]
    
    let url = baseURL.withQueries(query)!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
        let jsonDecoder = JSONDecoder()
        print("data:: ", data)
        if let data = data, let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
            completion(photoInfo)
        } else {
            print("No data was found, or data was not properly decoded.")
            completion(nil)
        }
    }
    task.resume()
}
