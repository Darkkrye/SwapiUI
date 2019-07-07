//
//   _____             _    _
//  |  __ \           | |  | |
//  | |  | | __ _ _ __| | _| | ___ __ _   _  ___
//  | |  | |/ _` | '__| |/ / |/ / '__| | | |/ _ \
//  | |__| | (_| | |  |   <|   <| |  | |_| |  __/
//  |_____/ \__,_|_|  |_|\_\_|\_\_|   \__, |\___|
//                                     __/ |
//                                    |___/
//
//  APIService.swift
//  
//
//  Created by Pierre on 07/07/2019.
//

import Foundation

internal class APIService {
    // Singleton variables
    static var shared = APIService()
    
    // Variables
    var headers = ["Content-Type": "application/json"]
    
    // Endpoints
    var ENDPOINT = "https://swapi.co/api/"
    
    // Private constructor for Singleton
    private init() {}
}

// Call Requests
extension APIService {
    func getRequest(route: String, headers: [String: String], completionHandler: @escaping ((_ statusCode: Int, _ data: Data?) -> Void)) {
        var request = URLRequest(url: URL(string: route)!)
        
        request.httpMethod = HTTPMethod.GET.rawValue
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if error == nil, let data = data, let realResponse = response as? HTTPURLResponse {
                completionHandler(realResponse.statusCode, data)
            } else {
                // Do something with the error
                print("Error")
                print(error ?? "Null")
            }
        }).resume()
    }
    
    func postRequest(route: String, headers: [String: String], body: Data, completionHandler: @escaping ((_ statusCode: Int, _ data: Data?) -> Void)) {
        var request = URLRequest(url: URL(string: route)!)
        
        request.httpMethod = HTTPMethod.POST.rawValue
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if error == nil, let data = data, let realResponse = response as? HTTPURLResponse {
                completionHandler(realResponse.statusCode, data)
            } else {
                // Do something with the error
            }
        }).resume()
    }
    
    func putRequest(route: String, headers: [String: String], body: Data, completionHandler: @escaping ((_ statusCode: Int, _ data: Data?) -> Void)) {
        var request = URLRequest(url: URL(string: route)!)
        
        request.httpMethod = HTTPMethod.PUT.rawValue
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if error == nil, let data = data, let realResponse = response as? HTTPURLResponse {
                completionHandler(realResponse.statusCode, data)
            } else {
                // Do something with the error
            }
        }).resume()
    }
}

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

// Enum for ENDPOINT routes
enum EndpointRoutes: String {
    case FILM = "films/"
    case PEOPLE = "people/"
    case PLANET = "planets/"
    case SPECY = "species/"
    case STARSHIP = "starships/"
    case VEHICLE = "vehicles/"
}
