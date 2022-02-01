//
//  CharactersItemView.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import SwiftUI
import URLImage

struct CharactersItemView: View {
    var character: Character
    
    
    init(_ character: Character) {
        self.character = character
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            URLImage(character.imageUrl) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            /// Not using AsyncImage as this api still has bugs while srolling, it cancels some of the image url sessions sometime. But it will be fix in next version of xcode release and then it will be good to go.
//            AsyncImage(url: character.imageUrl, transaction: Transaction(animation: .spring())) { phase in
//                switch phase {
//                case .empty:
//                    Color.purple.opacity(0.1)
//
//                case .success(let image):
//                    image
//                        .resizable()
//                        .scaledToFill()
//
//                case .failure(_):
//                    Image(systemName: "exclamationmark.icloud")
//                        .resizable()
//                        .scaledToFit()
//
//                @unknown default:
//                    Image(systemName: "exclamationmark.icloud")
//                }
//            }
            .cornerRadius(20)
            
            HStack(alignment: .bottom) {
                LivingStatusView.init(status: character.status ?? .unknown)
                Text(character.name ?? Constants.na)
                    .foregroundColor(.white)
                Spacer()
                Text("\(character.created?.MMMddYYYYFormat() ?? Constants.na)")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 44)
            .background(Color.black.opacity(0.3))
        }
    }
}
