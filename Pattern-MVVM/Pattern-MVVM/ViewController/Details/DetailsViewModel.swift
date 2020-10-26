//
//  CheckInViewModel.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//

import Foundation
struct DetailsViewModel {
    
    var checkInService = DetailsService()
    var checkInModel = CheckIn()
    
    func checkInEvent(eventId: String, name: String, email: String){
        checkInService.checkInEvents(eventId: eventId, name: name, email: email)
    }
}
