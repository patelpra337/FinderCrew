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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
