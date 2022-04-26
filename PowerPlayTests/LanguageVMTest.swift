//
//  LanguageVMTest.swift
//  PowerPlayTests
//
//  Created by Luis Lasierra on 26/4/22.
//

import XCTest
@testable import PowerPlay

class LanguageVMTest: XCTestCase {

    var language4Test:LanguagesVM!
    var filename = "CodeLanguajes"
    
    override func setUpWithError() throws {
        language4Test = LanguagesVM()
    }

    override func tearDownWithError() throws {
        language4Test = nil
        
    }
    //Test
    func testFilenameLanguage() throws {
        XCTAssertEqual(language4Test.jsonLanguajes,filename,"Language Filename modified")
    }
    
    func testLoadLanguages() throws {
        let bundle = Bundle.main
        let url = try XCTUnwrap(bundle.url(forResource: filename, withExtension: "json"), "Languagues file is not reachable")
        XCTAssertNoThrow(try Data(contentsOf: url))
        let jsonData = try Data(contentsOf: url)
        
        let languages = try JSONDecoder().decode(
            LanguageDict.self, from: jsonData)
        XCTAssertEqual(languages.count, 182)
        XCTAssertEqual(languages["ve"]!.name, "Venda")
        XCTAssertEqual(languages["es"]!.name, "Spanish; Castilian")
       
        let availableLanguages = languages.keys.map({
            AvailableLanguage(id: $0, name: languages[$0]!.name, nativeName: languages[$0]!.nativeName)}).sorted { $0.name < $1.name }
        XCTAssertEqual(availableLanguages.count, 182)
        XCTAssertEqual(availableLanguages[0].id, "ab")
    }
    
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
