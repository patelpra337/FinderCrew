//
//  Person.swift
//  FinderCrew
//
//  Created by patelpra on 1/16/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import Foundation

struct PersonSearch: Decodable {
    let results: [Person]
}

struct Person: Decodable {
    let name: String
    let gender: String
    let birthYear: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
    }
    
}
