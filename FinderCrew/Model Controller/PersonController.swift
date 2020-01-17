//
//  PersonController.swift
//  FinderCrew
//
//  Created by patelpra on 1/16/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import Foundation

class PersonController {
    // MARK: - Properties
    private let baseURL = URL(string: "https://swapi.co/api/people")!
    
    var people: [Person] = []
    
    enum HTTPMethod: String {
        case get = "GET"
        case put = "PUT"
        case post = "POST"
        case delete = "DELETE"
    }
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping () -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURl = urlComponents?.url else {
            print("Error: Request URL is nil!")
            completion()
            return
        }
        
        var request = URLRequest(url: requestURl)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard error == nil else {
                print("Error fetching data: \(error!)")
                completion()
                return
            }
          
            guard let data = data else {
                print("Error: No data returned from data task!")
                completion()
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                self.people = personSearch.results
            } catch {
                print("Unable to decode data into object of type [Person]: \(error)")
            }
            completion()
        }.resume()
    }
}
