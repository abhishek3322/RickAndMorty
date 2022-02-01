//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import Foundation


class CharactersViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var showErrorAlert = false

    var paginationFinished = false
    var paginationInfo: CharacterResultInfo?
    var currentPage = 1

    private var url: URL? {
        if let info = paginationInfo, let nextPage = info.next {
            return URL(string: nextPage)
        }
        return URL(string: Constants.URLPath.characters)
    }
    
    func fetchCharacters() {
        guard let url = self.url else { return }
        let request = APIRequest(url: url)
        request.perform { [weak self] (response: CharacterResponse?, error) -> Void in
            if let error = error {
                self?.handleErrorResponse(error)
                return
            }
            self?.handleSuccessResponse(response)
        }
    }
    
    func handleSuccessResponse(_ response: CharacterResponse?) {
        paginationInfo = response?.info
        if let items = response?.results {
            characters.append(contentsOf: items)
            currentPage += 1
            paginationFinished = response?.info?.next == nil
        }
    }
    
    func handleErrorResponse(_ error: Error) {
        paginationFinished = true
        showErrorAlert = true
        print(error.localizedDescription)
    }
}
