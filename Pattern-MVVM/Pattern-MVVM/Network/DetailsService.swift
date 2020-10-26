//
//  DetailsService.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 25/10/20.
//

import Foundation

protocol DetailsServiceProtocol: class {
    func checkInEvents(eventId:String, name: String, email: String)
}

protocol DetailsServiceDelegate {
    func checkIn(_ result: Bool)
}

class DetailsService: DetailsServiceProtocol {

    var detailsServiceDelegate: DetailsServiceDelegate?
    func checkInEvents(eventId: String, name: String, email: String) {
        let params = ["eventId": eventId, "name": name, "email":email]
        EventService<CheckIn>.checkin.request(params: params){ result in
            switch result{
            case .success(_):
                self.detailsServiceDelegate?.checkIn(true)
               
            case .failure:
                self.detailsServiceDelegate?.checkIn(false)
                break
            
            }
        }
    }
}

