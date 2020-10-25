//
//  HomeService.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation

protocol HomeServiceProtocol: class {
    func fetch()
}

protocol HomeServiceDelegate {
    func onHomeFetched(_ result: [Events])
}

class HomeService: HomeServiceProtocol {
    var homeServiceDelegate: HomeServiceDelegate?
    
    func fetch(){
        
        EventService<[Events]>.allEvents.request { result in
            switch result {
            
            case let .success(result):
                
                
                self.homeServiceDelegate?.onHomeFetched(result)
                
                
                
            case .failure:
                print("erro")
                break
            }
        }
    }
    
    let homeService: EventService<[Events]>
    
    init(homeService: EventService<[Events]> = .allEvents) {
        self.homeService = homeService
    }
    
}

