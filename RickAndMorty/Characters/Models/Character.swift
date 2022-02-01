//
//  Character.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import Foundation

struct Character: Decodable, Identifiable, Equatable {
    var id: Int64?
    var name: String?
    var status: LivingStatus?
    var species: String?
    var type: String?
    var gender: String?
    var origin: LocationInfo?
    var image: String?
    var episode: [String]?
    var created: Date?
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
    
    private enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender, origin, image, episode, created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int64.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decode(LivingStatus.self, forKey: .status)
        type = try container.decode(String.self, forKey: .type)
        gender = try container.decode(String.self, forKey: .gender)
        species = try container.decode(String.self, forKey: .species)
        origin = try container.decode(LocationInfo.self, forKey: .origin)
        image = try container.decode(String.self, forKey: .image)
        episode = try container.decode([String].self, forKey: .episode)

        let dateString = try container.decode(String.self, forKey: .created)
        let formatter = DateFormatter.iso8601Full
        if let date = formatter.date(from: dateString) {
            created = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .created,
                  in: container,
                  debugDescription: "Date string does not match format expected by formatter.")
        }
    }
    
    
    var imageUrl: URL {
        return URL(string: image ?? "")!
    }
}
