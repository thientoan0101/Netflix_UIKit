//
//  NetflixClone_APICallerTests.swift
//  NetflixClone_APICallerTests
//
//  Created by LAP15516 on 02/07/2022.
//

import XCTest
@testable import NetflixClone


class NetflixClone_APICallerTests: XCTestCase {

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
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testApiCallGetTrendingsSuccessful() {
        var data2: Data
        do {
            let t1 = Title(id: 1, media_type: "Optional(\"movie\")", original_language: "Optional(\"en\")", original_title: "Naruto", original_name: "nato", title: "naruto", poster_path: "/path", overview: "anime hehe", release_date: "Optional(\"2022-06-15\")", vote_average: 4.5, vote_count: 3)
            let list = TrendingTitleResponse(results: [t1])
            let encodeData = try JSONEncoder().encode(list)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        apiCaller.getTrendingMovies { result in
            switch result {
            case .success(let titles):
                
                print(titles)
                XCTAssertEqual(titles.count, 1)
                print("huhu")
            case .failure(_):
//                XCTAssertEqual("\(error.localizedDescription)", "The operation couldn’t be completed. (NetflixClone.APIError error 0.)")
                XCTFail()
            }
        }
    }
    
    func testApiCallGetTrendingsFail() {
        let session = NetworkSessionMock()
        session.data = "dummyData".data(using: .utf8)!
        let apiCaller = APICaller(session: session)
       
        apiCaller.getTrendingMovies { result in
            switch result {
//            case .success(let titles):
//                //cell.configure(with: titles)
//                print(titles)
//                XCTAssertEqual(titles.count, 1)
//                print("huhu")
            case .failure(let error):
                XCTAssertEqual("\(error.localizedDescription)", "The operation couldn’t be completed. (NetflixClone.APIError error 0.)")
            case .success(_):
                XCTFail()
            }
        }
    }
    
    
    func testApiCallGetTrendingsTVSuccessful() {
        var data2: Data
        do {
            let t1 = Title(id: 1, media_type: "Optional(\"movie\")", original_language: "Optional(\"en\")", original_title: "Naruto", original_name: "nato", title: "naruto", poster_path: "/path", overview: "anime hehe", release_date: "Optional(\"2022-06-15\")", vote_average: 4.5, vote_count: 3)
            let list = TrendingTitleResponse(results: [t1])
            let encodeData = try JSONEncoder().encode(list)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        apiCaller.getTrendingTVs { result in
            switch result {
            case .success(let titles):
                XCTAssertEqual(titles.count, 1)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testApiCallGetTrendingsTVFail() {
        let session = NetworkSessionMock()
        session.data = "dummyData".data(using: .utf8)!
        let apiCaller = APICaller(session: session)
       
        apiCaller.getTrendingTVs { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual("\(error.localizedDescription)", "The operation couldn’t be completed. (NetflixClone.APIError error 0.)")
            case .success(_):
                XCTFail()
            }
        }
    }

    func testApiCallGetUpcomingSuccessful() {
        var data2: Data
        do {
            let t1 = Title(id: 1, media_type: "Optional(\"movie\")", original_language: "Optional(\"en\")", original_title: "Naruto", original_name: "nato", title: "naruto", poster_path: "/path", overview: "anime hehe", release_date: "Optional(\"2022-06-15\")", vote_average: 4.5, vote_count: 3)
            let list = TrendingTitleResponse(results: [t1])
            let encodeData = try JSONEncoder().encode(list)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        apiCaller.getUpcomingMovies { result in
            switch result {
            case .success(let titles):
                XCTAssertEqual(titles.count, 1)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testApiCallGetUpcomingFail() {
        let session = NetworkSessionMock()
        session.data = "dummyData".data(using: .utf8)!
        let apiCaller = APICaller(session: session)
       
        apiCaller.getUpcomingMovies { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual("\(error.localizedDescription)", "The operation couldn’t be completed. (NetflixClone.APIError error 0.)")
            case .success(_):
                XCTFail()
            }
        }
    }
    
    
    func testApiCallGetPopularSuccessful() {
        var data2: Data
        do {
            let t1 = Title(id: 1, media_type: "Optional(\"movie\")", original_language: "Optional(\"en\")", original_title: "Naruto", original_name: "nato", title: "naruto", poster_path: "/path", overview: "anime hehe", release_date: "Optional(\"2022-06-15\")", vote_average: 4.5, vote_count: 3)
            let list = TrendingTitleResponse(results: [t1])
            let encodeData = try JSONEncoder().encode(list)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        apiCaller.getPopular { result in
            switch result {
            case .success(let titles):
                XCTAssertEqual(titles.count, 1)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testApiCallGetPopularTVFail() {
        let session = NetworkSessionMock()
        session.data = "dummyData".data(using: .utf8)!
        let apiCaller = APICaller(session: session)
       
        apiCaller.getPopular { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual("\(error.localizedDescription)", "The operation couldn’t be completed. (NetflixClone.APIError error 0.)")
            case .success(_):
                XCTFail()
            }
        }
    }
    
    func testApiCallGetTopRatedSuccessful() {
        var data2: Data
        do {
            let t1 = Title(id: 1, media_type: "Optional(\"movie\")", original_language: "Optional(\"en\")", original_title: "Naruto", original_name: "nato", title: "naruto", poster_path: "/path", overview: "anime hehe", release_date: "Optional(\"2022-06-15\")", vote_average: 4.5, vote_count: 3)
            let list = TrendingTitleResponse(results: [t1])
            let encodeData = try JSONEncoder().encode(list)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        apiCaller.getTopRated { result in
            switch result {
            case .success(let titles):
                XCTAssertEqual(titles.count, 1)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testApiCallGetTopRatedFail() {
        let session = NetworkSessionMock()
        session.data = "dummyData".data(using: .utf8)!
        let apiCaller = APICaller(session: session)
       
        apiCaller.getTopRated { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual("\(error.localizedDescription)", "The operation couldn’t be completed. (NetflixClone.APIError error 0.)")
            case .success(_):
                XCTFail()
            }
        }
    }
    
    func testApiCallGetDiscoverSuccessful() {
        var data2: Data
        do {
            let t1 = Title(id: 1, media_type: "Optional(\"movie\")", original_language: "Optional(\"en\")", original_title: "Naruto", original_name: "nato", title: "naruto", poster_path: "/path", overview: "anime hehe", release_date: "Optional(\"2022-06-15\")", vote_average: 4.5, vote_count: 3)
            let list = TrendingTitleResponse(results: [t1])
            let encodeData = try JSONEncoder().encode(list)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        apiCaller.getDiscoverMovies { result in
            switch result {
            case .success(let titles):
                XCTAssertEqual(titles.count, 1)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testApiCallGetDiscoverFail() {
        let session = NetworkSessionMock()
        session.data = "dummyData".data(using: .utf8)!
        let apiCaller = APICaller(session: session)
       
        apiCaller.getDiscoverMovies { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual("\(error.localizedDescription)", "The operation couldn’t be completed. (NetflixClone.APIError error 0.)")
            case .success(_):
                XCTFail()
            }
        }
    }
    
    func testSearchSuccessful() {
        var data2: Data
        do {
            let t1 = Title(id: 1, media_type: "Optional(\"movie\")", original_language: "Optional(\"en\")", original_title: "Naruto", original_name: "nato", title: "naruto", poster_path: "/path", overview: "anime hehe", release_date: "Optional(\"2022-06-15\")", vote_average: 4.5, vote_count: 3)
            let list = TrendingTitleResponse(results: [t1])
            let encodeData = try JSONEncoder().encode(list)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        let query = "naruto"
        apiCaller.search(with: query) { result in
            switch result {
            case .success(let titles):
                XCTAssertEqual(titles.count, 1)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func testGetYoutubeContent() {
        var data2: Data
        do {
            let idVideoElement = IdVideoElement(kind: "youtube#video", videoId: "TWChnPaRbGU")
            let videoElement = VideoElement(id: idVideoElement)
            let youtubeResultSearch = YoutubeSearchResponse(items: [videoElement])
            
            let encodeData = try JSONEncoder().encode(youtubeResultSearch)
            data2 = encodeData
        } catch {
            data2 = "response".data(using: .utf8)!
        }
     
        let session = NetworkSessionMock()
        session.data = data2
        let apiCaller = APICaller(session: session)
        let query = "naruto"
        apiCaller.getMovie(with: query) { result in
            switch result {
            case .success(let title):
                XCTAssertEqual(title.id.videoId, "TWChnPaRbGU")
            case .failure(_):
                XCTFail()
            }
        }
    }
}
