//
//  Currency.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 09/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import Foundation

class Currency {
    var name = ""
    var value = 0.0
    
    init(name: String, value: Double){
        self.name = name
        self.value = value
    }
}
