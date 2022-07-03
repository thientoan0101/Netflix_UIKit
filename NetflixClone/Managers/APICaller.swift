//
//  APICaller.swift
//  NetflixClone
//
//  Created by LAP15516 on 25/06/2022.
//

import Foundation

struct Constant {
    static let API_KEY = "03bf09c583c09304b3a3aedaf6bf7a5a"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyAzN3knkQlEkwlAHQE-w7lFATOweE1SdwQ"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
//    private let session: URLSession
    private let session: NetworkSession
    
    
    init(session: NetworkSession = URLSession.shared) {
            self.session = session
    }
    
//    init(session: URLSession = .shared) {
//        self.session = session
//        print(session)
//    }
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/movie/day?api_key=\(Constant.API_KEY)") else { return }
        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
//            } catch {
//                completion(.failure(APIError.failedToGetData))
//            }
//        }

        
        
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            print("after guard data")
            
    
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print("\n\nRESULT NE:\n\(results)\n\nhet result")
                completion(.success(results.results))
                let encoded = try JSONEncoder().encode(results)
                print("\n\n\nencoded:\n\(String(data: encoded, encoding: .utf8)!)\n\nencoded")
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        //task.resume()
    }
    
    func getTrendingTVs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/trending/tv/day?api_key=\(Constant.API_KEY)") else { return }
        
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            print("\n\nData:\n\(data)")
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print("\n\nResult:\n\(results)")
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
//        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/upcoming?api_key=\(Constant.API_KEY)") else { return }
        
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        //task.resume()
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/popular?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        //task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/movie/top_rated?api_key=\(Constant.API_KEY)&language=en-US&page=1") else { return }
        
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
            
        }
        //task.resume()
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constant.baseURL)/3/discover/movie?api_key=\(Constant.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else { return }
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }

        }
        //task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        guard let url = URL(string: "\(Constant.baseURL)/3/search/movie?api_key=\(Constant.API_KEY)&query=\(query)") else { return }
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }

        }
        //task.resume()
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constant.YoutubeBaseURL)q=\(query)&key=\(Constant.YoutubeAPI_KEY)") else { return }
        
        session.loadData(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                print("\n\n\nYoutube:\n\(results)\n\nend youtube")
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            
        }
        
        //task.resume()
        
    }
    
}


// MARK: MOCK CLASS FOR UNIT TEST

//// We create a partial mock by subclassing the original class
//class URLSessionDataTaskMock: URLSessionDataTask {
//
//    private let closure: () -> Void
//
//    init(closure: @escaping () -> Void)
//    {
//        print("closure init")
//        self.closure = closure
//    }
//
//    // We override the 'resume' method and simply call our closure
//    // instead of actually resuming any task.
//    override func resume() {
//        print("excute resume mock data task")
//        closure()
//    }
//}

//
//class URLSessionMock: URLSession {
//
//    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
//
//    // Properties that enable us to set exactly what data or error
//    // we want our mocked URLSession to return for any request.
//    var data: Data?
//    var error: Error?
//
//    override func dataTask(with URLRequest: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
//        print("inside datatask mock")
//        let response =
//                    """
//                      [
//                          {
//                              "firstName": "Lee",
//                              "lastName": "Burrows"
//                          },
//                          {
//                              "firstName": "Dolly",
//                              "lastName": "Burrows"
//                          }
//                      ]
//                      """
//        let data1 = response.data(using: .utf8)!
//        let error1 = APIError.failedToGetData
//        //completionHandler(data1, nil, error1)
////        Result<AnyObject, Error> result
////
//        return URLSessionDataTaskMock {
//            completionHandler(data1, nil, error1)
//            //completionHandler(data1, nil, error1)
//            //return Result<[Title], Er
//        }
//
//    }
//
//
//
//
//
//}




// MARK: MOCK WITH PROTOCOL

protocol NetworkSession {
    func loadData(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func loadData(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: request) { (data, _, error) in
            completionHandler(data, nil, error)
        }

        task.resume()
    }
}


class NetworkSessionMock: NetworkSession {
    var data: Data?
    var error: Error?

    func loadData(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        completionHandler(data, nil, error)
    }
}
