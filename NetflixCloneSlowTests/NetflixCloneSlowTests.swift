//
//  NetflixCloneSlowTests.swift
//  NetflixCloneSlowTests
//
//  Created by LAP15516 on 01/07/2022.
//

import XCTest
@testable import NetflixClone



class NetflixCloneSlowTests: XCTestCase {

    var sut: APICaller!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = APICaller()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    // Asynchronous test: success fast, failure slow
    func testValidApiCallGetsHTTPStatusCode200() throws {
//      // given
//      let urlString =
//        "https://www.google.com"
//      let url = URL(string: urlString)!
//      // 1
//      let promise = expectation(description: "Status code: 200")
//
//      // when
//      let dataTask = sut.dataTask(with: url) { _, response, error in
//        // then
//        if let error = error {
//          XCTFail("Error: \(error.localizedDescription)")
//          return
//        } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
//          if statusCode == 200 {
//            // 2
//            promise.fulfill()
//          } else {
//            XCTFail("Status code: \(statusCode)")
//          }
//        }
//      }
//      dataTask.resume()
//      // 3
//      wait(for: [promise], timeout: 5)
        
        
        
//        APICaller.shared.getTrendingMovies { result in
//            switch result {
//            case .success(let titles):
//                cell.configure(with: titles)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
