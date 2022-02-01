//
//  CharacterResultInfo.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import Foundation

struct CharacterResultInfo: Decodable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
}
