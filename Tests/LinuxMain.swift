import XCTest

import SetupTests

var tests = [XCTestCaseEntry]()
tests += SetupTests.allTests()
XCTMain(tests)
