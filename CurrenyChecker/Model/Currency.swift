//
//  Currency.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 09/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Currency: NSObject, NSCoding {
    private(set) var baseCurrencyName = ""
    private(set) var targetCurrencyName = ""
    private var value = 0.0
    private(set) var completeTargetCurrencyData = ""
    
    init(baseCurrencyName: String, targetCurrencyName: String){
        self.baseCurrencyName = baseCurrencyName
        self.targetCurrencyName = targetCurrencyName
    }
    
    func getCurrencyValue(url: String, parameters: [String : String], completion: @escaping () -> ()) {
        AF.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            switch response.result {
            case .success(let data):
                let currencyData: JSON = JSON(data)
                self.value = currencyData["rates"]["\(self.targetCurrencyName)"].doubleValue
                self.completeTargetCurrencyData = "\(String(format: "%.2f", self.value)) \(self.targetCurrencyName)"
            case .failure(let error):
                self.completeTargetCurrencyData = "Unable to get data"
                print(error)
            }
            completion()
        }
    }
    
    // Data archiving methods
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.baseCurrencyName, forKey: "baseCurrencyName")
        aCoder.encode(self.targetCurrencyName, forKey: "targetCurrencyName")
    }
    
    required init?(coder aDecoder: NSCoder) {
        baseCurrencyName = aDecoder.decodeObject(forKey: "baseCurrencyName") as! String
        targetCurrencyName = aDecoder.decodeObject(forKey: "targetCurrencyName") as! String
    }
    
}
