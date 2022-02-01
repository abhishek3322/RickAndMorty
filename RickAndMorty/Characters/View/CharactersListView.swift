//
//  CharactersListView.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject private var model = CharactersViewModel()
    @State private var selectedCharacter: Character? = nil

    
    var body: some View {
        NavigationView {
            List {
                ForEach(model.characters) { character in
                    CharactersItemView(character)
                    .listRowInsets(.init(.zero))
                    .padding()
                    .onTapGesture {
                        self.selectedCharacter = character
                    }
                }
                if model.paginationFinished == false {
                    ProgressView()
                    .onAppear {
                        model.fetchCharacters()
                    }
                }
            }
            .navigationBarTitle(Constants.characters)
            .listStyle(.plain)
            .onAppear {
                model.fetchCharacters()
            }
        }
        .sheet(item: self.$selectedCharacter) { character in
            CharacterDetailedView(character: character)
        }
        .alert(isPresented: $model.showErrorAlert, content: { () -> Alert in
            Alert(title: Text(Constants.error), message: Text(Constants.errorMessage), primaryButton: .default(Text(Constants.cancel)), secondaryButton: Alert.Button.destructive(Text(Constants.tryAgain), action: {
                model.fetchCharacters()
            }))
        })
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
