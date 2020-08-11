//
//  Market.swift
//  FlightApp
//
//  Created by João Palma on 01/08/2020.
//  Copyright © 2020 João Palma. All rights reserved.
//

struct Market {
    private var _market: MarketObject
    
    init(_ market: MarketObject) {
        _market = market
    }
    
    func getCode() -> String {
        return _market.code
    }
}
