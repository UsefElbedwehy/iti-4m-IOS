//
//  day7Task2Tests.swift
//  day7Task2Tests
//
//  Created by Usef on 01/02/2025.
//

import XCTest
@testable import day7Task2
final class day7Task2Tests: XCTestCase {
    var connectionManager = ConnectionManager()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadDataFromApi(){
        let myExpectation = expectation(description: "waiting for api")
        connectionManager.loadDataFromApi(url: "https://www.freetestapi.com/api/v1/movies") { movies, error in
            if let error = error {
                XCTFail()
            }else{
                XCTAssert(movies?.count == 20)
                myExpectation.fulfill()
            }
            
        }
        waitForExpectations(timeout: 5)
    }
    

}
