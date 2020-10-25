//
//  File.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation
struct ResultEvent:Codable {
    var result:[Events?]?
}

struct Events: Codable {
    var people: [People]?
    var date: Int?
    var description: String?
    var image: String?
    var longitude: Double?
    var latitude: Double?
    var price: Double?
    var title: String?
    var id: String?

}
