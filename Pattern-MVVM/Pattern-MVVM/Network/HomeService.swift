//
//  HomeService.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation

protocol HomeServiceProtocol: class {
    func fetchAllEvents()
}

protocol HomeServiceDelegate {
    func onHomeFetched(_ result: [Events])
}

class HomeService: HomeServiceProtocol {
    var homeServiceDelegate: HomeServiceDelegate?
    
    func fetchAllEvents(){
        EventService<[Events]>.allEvents.request { result in
            switch result {
            case let .success(result):
                DispatchQueue.main.async{
                    self.homeServiceDelegate?.onHomeFetched(result)
                }
                
            case .failure:
                print("erro")
                break
            }
        }
    }
}

