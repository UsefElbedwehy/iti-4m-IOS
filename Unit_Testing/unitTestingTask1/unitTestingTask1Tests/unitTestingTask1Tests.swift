//
//  unitTestingTask1Tests.swift
//  unitTestingTask1Tests
//
//  Created by Usef on 29/01/2025.
//

import XCTest
@testable import unitTestingTask1

final class unitTestingTask1Tests: XCTestCase {
    var userObj:User!
    var empObj: Employee!
    override func setUpWithError() throws {
        userObj = User(password: "0123456789", username: "Usef_Elbedwehy")
        empObj = Employee(name: "Usef")
        empObj.grossSalary = 5_000
    }

    override func tearDownWithError() throws {
        userObj = nil
        empObj = nil
    }

    func testAuthentication(){
        XCTAssertTrue(userObj.authentication(), "XXX Authentication Failed XXX")
//        XCTAssertFalse(userObj.authentication(), "XXX Authentication Success XXX")
//        XCTAssert(userObj.authentication() == false)
//        XCTAssert(userObj.authentication() == true)
//        XCTAssert(userObj.authentication() == false, "XXX Authentication Failed XXX")
    }
    
    func testCalcNetSalary(){
        
        //XCFail if the gross salary is nil
        XCTAssertNotNil(empObj.grossSalary, "XXX grosSalaray is nil XXX")
        empObj.calcNetSalary()
        //Test that Emp's annual salary > minimum Annual Salary
        print("\(empObj.annualNetSalary) and \(empObj.minAnnualNetSalary)")
        XCTAssertGreaterThan(empObj.annualNetSalary, empObj.minAnnualNetSalary, "XXX annual salary < minimum Annual Salary XXX")
        
        //Test that Emp's annual salary < maximum Annual Salary
        print("\(empObj.annualNetSalary) and \(empObj.maxAnnualNetSalary)")
        XCTAssertLessThan(empObj.annualNetSalary, empObj.maxAnnualNetSalary, "XXX annual salary > maximum Annual Salary XXX")
        
        //Test that Emp's deduction percentage for Emp with gross salary 5_000 is equal 5%
        if empObj.grossSalary == 5000 {
            print("\(empObj.deductionsPersentage)")
            XCTAssertEqual(empObj.deductionsPersentage, 5, "XXX deduction percentage for Emp with gross salary 5_000 is not equal 5% XXX")
        }
    }
    
    
    
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }
//
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
