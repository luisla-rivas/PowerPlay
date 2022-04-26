//
//  GenresVMTest.swift
//  PowerPlayTests
//
//  Created by Luis Lasierra on 25/4/22.
//

import XCTest
@testable import PowerPlay

class GenresVMTest: XCTestCase {
    
    var genres4Test:GenresVM!
    let urlGenreTest = "https://api.themoviedb.org/3/genre/movie/list?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US"
    override func setUpWithError() throws {
        genres4Test = GenresVM()
    }

    override func tearDownWithError() throws {
        genres4Test = nil
    }
    
    func testUrlGenre() throws {
        XCTAssertEqual(genres4Test.urlGenre,urlGenreTest)
    }

    func testLoadGenre() async throws {
    //        XCTAssertEqual(genres4Test.urlGenre,urlGenreTest)
        let expectative = expectation(description: "Loading test for Genres")

        //URL test
        let url = try XCTUnwrap(URL(string: urlGenreTest),"URL Unwrap fail")
        //Server test
        //FIXME: Test Async/Away Throw
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
//            throw URLError(.badServerResponse)
//        }
        
        
        expectative.fulfill()

//        XCTAssertEqual(response.statusCode, 200, "El StatusCode es \(response.statusCode)")

        await waitForExpectations(timeout: 5, handler:nil)
    
        //Data decode test
//        XCTAssertNoThrow(try JSONDecoder().decode(Genres.self, from: data),"Genres decode throws error")
//        let dataDecode = try JSONDecoder().decode(Genres.self, from: data)
//        XCTAssertNotEqual(dataDecode.count, 20)

    }
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
