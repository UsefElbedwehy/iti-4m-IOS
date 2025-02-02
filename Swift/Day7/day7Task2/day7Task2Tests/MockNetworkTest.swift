//
//  MockNetworkTest.swift
//  day7Task2Tests
//
//  Created by Usef on 01/02/2025.
//

import XCTest

final class MockNetworkTest: XCTestCase {
    var fakeNetworkObj = FakeNetwork(shouldReturnError: false)
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDataFromApi(){
        fakeNetworkObj.loadDataFromApi(url: "") { new, error in
            if let error = error{
                XCTFail()
            }else{
                XCTAssertNotNil(new)
            }
        }
    }
    

}
