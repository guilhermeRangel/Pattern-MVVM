//
//  HomeView.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
struct HomeViewModel {
    
    var homeService = HomeService()
    var modelHomeEvents = ResultEvent()
    var modelHome = Events()
    
    func fetch(){
        homeService.fetch()
    }
}
