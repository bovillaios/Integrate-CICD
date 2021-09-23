//
//  Integrate_CICDTests.swift
//  Integrate CICDTests
//
//  Created by Ramgopal on 23/09/21.
//

import XCTest
@testable import Integrate_CICD

class Integrate_CICDTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test1() {
        
        XCTAssert(1==1)
    }
    
    func test2() {
        
        XCTAssert(1==0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
