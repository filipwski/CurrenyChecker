//
//  TableViewSettings.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 11/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import UIKit

extension CurrencyTableViewController {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currencies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CurrencyTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CurrencyTableViewCell else {
            fatalError("The dequeued cell is not an instance of CurrencyTableViewCell.")
        }
        
        let currency = currencies[indexPath.row]
        
        let baseUrl = "https://api.exchangeratesapi.io/latest"
        let parameters = ["base" : currency.baseCurrencyName, "symbols" : currency.targetCurrencyName]
        
        cell.currencyName.text = currency.baseCurrencyName
        if monitor.currentPath.status == .unsatisfied {
            cell.currencyValue.text = "Loading..."
        } else {
            currency.getCurrencyValue(url: baseUrl, parameters: parameters, completion: {
                cell.currencyValue.text = currency.completeTargetCurrencyData
            })
        }
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            currencies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } /* else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         } */
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = currencies[fromIndexPath.row]
        currencies.remove(at: fromIndexPath.row)
        currencies.insert(itemToMove, at: to.row)
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
