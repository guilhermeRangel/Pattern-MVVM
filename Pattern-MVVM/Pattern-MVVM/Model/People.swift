//
//  People.swift
//  Pattern-MVVM
//
//  Created by Guilherme Rangel on 24/10/20.
//

import Foundation

struct People : Codable {
    var id : String?
    var name : String?
    var eventId : String?
    var picture : String?
    

    enum CodingKeys: String, CodingKey {

        case picture = "picture"
        case name = "name"
        case eventId = "eventId"
        case id = "id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        picture = try values.decodeIfPresent(String.self, forKey: .picture)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        eventId = try values.decodeIfPresent(String.self, forKey: .eventId)
        id = try values.decodeIfPresent(String.self, forKey: .id)
    }

}
