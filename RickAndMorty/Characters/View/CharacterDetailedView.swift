//
//  CharacterDetailedView.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import SwiftUI
import URLImage

struct CharacterDetailedView: View {
    
    var character: Character
    
    
    var body: some View {

        URLImage(character.imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
