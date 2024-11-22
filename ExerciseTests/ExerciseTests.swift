//
//  ExerciseTests.swift
//  ExerciseTests
//
//  Created by Jordan Gordeev on 22.11.24.
//

import XCTest
@testable import Exercise

final class ExerciseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	func testCarModelValidator2() throws {
		let carModelValidator = CarModelValidator()
		let model = "ab"
		let r = carModelValidator.validate(model)
		XCTAssertNotNil(r)
	}

	func testCarModelValidator3() throws {
		let carModelValidator = CarModelValidator()
		let model = "abc"
		let r = carModelValidator.validate(model)
		XCTAssertNil(r)
	}

	func testCarModelValidator4() throws {
		let carModelValidator = CarModelValidator()
		let model = "abcd"
		let r = carModelValidator.validate(model)
		XCTAssertNil(r)
	}
	
	func testTrafficLightsPhasesIterator() throws {
		var phasesIterator = TrafficLightsPhasesIterator()
		let p1 = phasesIterator.nextPhase()
		let p2 = phasesIterator.nextPhase()
		let p3 = phasesIterator.nextPhase()
		let p4 = phasesIterator.nextPhase()
		
		XCTAssert(p1 == (.green, 4))
		XCTAssert(p2 == (.orange, 1))
		XCTAssert(p3 == (.red, 4))
		XCTAssert(p4 == (.green, 4))
	}
}
