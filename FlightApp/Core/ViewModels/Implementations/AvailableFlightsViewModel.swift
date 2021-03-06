//
//  AvailableFlightsViewModel.swift
//  FlightApp
//
//  Created by João Palma on 31/07/2020.
//  Copyright © 2020 João Palma. All rights reserved.
//

class AvailableFlightsViewModel : ViewModelBase {
    private(set) var flights : Flights!
    
    override func prepare(dataObject: Any) {
        if let flights = dataObject as? FlightsStruct {
            _setFlights(flights)
        }
    }
    
    private func _setFlights(_ flights : FlightsStruct) {
        self.flights = Flights(flights)
    }
    
    private func _canExecute() -> Bool {
        return !isBusy.value
    }
    
    //L10N
    let titleLabel = L10N.localize(key: "availableflights_title")
    let departLabel = L10N.localize(key: "availableflights_depart")
    let arriveLabel = L10N.localize(key: "availableflights_arrive")
    let flightNrLabel = L10N.localize(key: "availableflights_flight")
    let noAvailableFlightsLabel = L10N.localize(key: "availableflights_noflights")
    let soldOutLabel = L10N.localize(key: "availableflights_soldout")
    let hrsLabel = L10N.localize(key: "global_hours")
}
