//
//  PersonSearchTableViewController.swift
//  FinderCrew
//
//  Created by patelpra on 1/16/20.
//  Copyright © 2020 Crus Technologies. All rights reserved.
//

import UIKit

class PersonSearchTableViewController: UITableViewController {

    // MARK: - Properties
    private let personController = PersonController()
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Public Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return personController.people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as! PersonTableViewCell
        
        guard indexPath.row < personController.people.count else { return cell }
        let person = personController.people[indexPath.row]
        cell.person = person
        return cell
        }

    }

extension PersonSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
            
        print("Search for \(searchTerm)...")
        
        personController.searchForPeopleWith(searchTerm: searchTerm) {
        DispatchQueue.main.async {
            print("Found \(self.personController.people.count) results!")
            self.tableView.reloadData()
            }
        }
    }
}
