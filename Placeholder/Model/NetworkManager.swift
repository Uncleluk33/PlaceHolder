//
//  NetworkManager.swift
//  Placeholder
//
//  Created by Lucas Clahar on 9/11/20.
//  Copyright © 2020 Tsahai Clahar. All rights reserved.
//

import Foundation


class NetworkManager {
    
    var fetchedData = [Data]()
    
    func fetchData() {
        //create URL session and asign session task
        if let url = URL(string: "https://jsonplaceholder.typicode.com/photos") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    //decode JSON and add new object to array
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([Data].self, from: safeData)
                                self.fetchedData = results
                        }catch{
                            print("error = \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
}

