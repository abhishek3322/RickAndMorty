//
//  CharacterResponse.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import Foundation

struct CharacterResponse: Decodable {
    var info: CharacterResultInfo?
    var results: [Character]?
}
