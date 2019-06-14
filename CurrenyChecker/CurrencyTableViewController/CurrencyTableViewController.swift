//
//  CurrencyTableViewController.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 08/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import UIKit

class CurrencyTableViewController: UITableViewController, NewCurrencyDelegation {
    
    //MARK: - Properties
    var currencies = [Currency]()
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    //MARK: - Actions
    @IBAction func startEditing(_ sender: Any) {
        isEditing = !isEditing
        if (isEditing) { editButton.title = "Save"
        } else { editButton.title = "Edit" }
    }
    
    override func viewDidLoad() {
        URLCache.shared.removeAllCachedResponses()
        super.viewDidLoad()
//        loadSampleData()
        tableView.tableFooterView = UIView()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func newCurrencyAdded(currencies: [Currency]) {
        self.currencies = currencies
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCurrency"{
            let settingsViewController = segue.destination as? SettingsViewController
            
            settingsViewController?.currencies = currencies
            settingsViewController?.delegate = self
        }
    }

}

//MARK: - Sample data

//extension CurrencyTableViewController {
//    private func loadSampleData() {
//        guard let currency1 = Currency(name: "Dollar", value: 1.1) as Currency? else {
//            fatalError("Unable to instantiate currency1")
//        }
//
//        guard let currency2 = Currency(name: "Euro", value: 1.2) as Currency? else {
//            fatalError("Unable to instantiate currency2")
//        }
//        guard let currency3 = Currency(name: "Złotówka", value: 1.3) as Currency? else {
//            fatalError("Unable to instantiate currency3")
//        }
//
//        currencies += [currency1, currency2, currency3]
//    }
//}
