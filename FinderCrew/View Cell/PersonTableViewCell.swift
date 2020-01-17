//
//  PersonTableViewCell.swift
//  FinderCrew
//
//  Created by patelpra on 1/16/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

// MARK: - Properties
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    // MARK: - Private Methods
    
    private func updateViews() {
        guard let person = person else { return }
            
        nameLabel.text = person.name
        genderLabel.text = "Gender: \(person.gender)"
        birthYearLabel.text = "Birth year: \(person.birthYear)"
    }
}
