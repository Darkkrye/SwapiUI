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
//  PeopleService.swift
//  
//
//  Created by Pierre on 07/07/2019.
//

import Foundation

public class PeopleService: NSObject {
    let mode: Mode = .full
    let api: APIService = APIService.shared
    
    public func getFilledPeoples(completionHandler: @escaping ((_ peoples: Array<FilledPeople>) -> Void)) {
        self.getPeoples { (peoples) in
            var filledPeoples = Array<FilledPeople>()
            for people in peoples {
                filledPeoples.append(FilledPeople(json: people))
            }
            
            completionHandler(filledPeoples)
        }
    }
    
    public func getPeoples(completionHandler: @escaping ((_ peoples: Array<People>) -> Void)) {
        let route = self.api.ENDPOINT + EndpointRoutes.PEOPLE.rawValue
        
        self.api.getRequest(route: route, headers: self.api.headers) { (statusCode, data) in
            guard let d = data, statusCode < 300 else { return }
            
            do {
                if let json = (try? JSONSerialization.jsonObject(with: d, options: [])) as? Dictionary<String, Any> {
                    if let results = json["results"] as? Array<Dictionary<String, Any>> {
                        var peoples = Array<People>()
                        for result in results {
                            let jsonData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                            let decoder = JSONDecoder()
                            let people = try decoder.decode(People.self, from: jsonData)
                            peoples.append(people)
                        }
                        
                        completionHandler(peoples)
                    }
                }
            } catch {
            
            }
        }
    }
}
