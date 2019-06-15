//
//  CurrencyTableViewController.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 08/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import UIKit
import Network

class CurrencyTableViewController: UITableViewController, NewCurrencyDelegation {
    
    //MARK: - Properties
    var currencies = [Currency]()
    let defaults = UserDefaults.standard
    let monitor = NWPathMonitor()
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    //MARK: - Actions
    @IBAction func startEditing(_ sender: Any) {
        isEditing = !isEditing
        if (isEditing) {
            editButton.title = "Save"
        } else {
            editButton.title = "Edit"
            archiveAndSetData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        // Data retrieving
        
        if let unarchivedObjects = defaults.data(forKey: "CurrenciesArray") {
            do {
                let array = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedObjects)  as? [Currency]
                currencies = array!
            } catch {
                fatalError("Error while unarchiving the data")
            }
        }
        
        refreshData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCurrency" {
            let settingsViewController = segue.destination as? SettingsViewController
            
            settingsViewController?.currencies = currencies
            settingsViewController?.delegate = self
        }
    }
    
    // NewCurrencyDelegation method implementation
    
    func newCurrencyAdded(currencies: [Currency]) {
        self.currencies = currencies
        
        archiveAndSetData()
        
        tableView.reloadData()
    }
    
    // UserDefaults set method
    
    private func archiveAndSetData() {
        do {
            let encodedCurrencies = try NSKeyedArchiver.archivedData(withRootObject: self.currencies, requiringSecureCoding: false)
            self.defaults.set(encodedCurrencies, forKey: "CurrenciesArray")
        } catch {
            fatalError("Error while saving encoded data")
        }
    }
    
    // Refresh data when connected
    
    private func refreshData() {
        let queue = DispatchQueue.global(qos: .background)
        monitor.pathUpdateHandler = {
            path in
            if path.status == .satisfied {
                self.tableView.reloadData()
            }
        }
        monitor.start(queue: queue)
    }
}
