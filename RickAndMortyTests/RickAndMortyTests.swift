//
//  RickAndMortyTests.swift
//  RickAndMortyTests
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import XCTest
@testable import RickAndMorty

class RickAndMortyTests: XCTestCase {

    func testHandleSuccessResponse() {
        let viewModel = CharactersViewModel()
        
        var response = CharacterResponse()
        response.results = []
        response.info = CharacterResultInfo.init(count: 200, pages: 4, next: "test", prev: "123")
        viewModel.handleSuccessResponse(response)
    
        XCTAssertTrue(viewModel.currentPage == 2)
    }
    
    func testHandleErrorResponse() {
        let viewModel = CharactersViewModel()
        
        viewModel.handleErrorResponse(MockError.someExpectedError)
    
        XCTAssertTrue(viewModel.paginationFinished)
        XCTAssertTrue(viewModel.showErrorAlert)
    }
}


private enum MockError: Error {
    case someExpectedError
    case someUnexpectedError
}
