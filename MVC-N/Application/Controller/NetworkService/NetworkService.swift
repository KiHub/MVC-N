//
//  NetworkService.swift
//  MVC-N
//
//  Created by  Mr.Ki on 03.04.2022.
//  Copyright © 2022 Mr.Ki
//

import Foundation

class NetworkService {
    
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, responce, error) in
            guard let data = data else {return}
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                DispatchQueue.main.async {
                    completion(json)
                }
                
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
