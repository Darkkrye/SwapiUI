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
//  FilmService.swift
//
//
//  Created by Pierre on 07/07/2019.
//

import Foundation

public class FilmService: NSObject {
    let mode: Mode = .full
    let api: APIService = APIService.shared
    
    public func getFilledFilms(completionHandler: @escaping ((_ films: Array<FilledFilm>) -> Void)) {
        self.getFilms { (films) in
            var filledFilms = Array<FilledFilm>()
            for film in films {
                filledFilms.append(FilledFilm(json: film))
            }
            
            completionHandler(filledFilms)
        }
    }
    
    public func getFilms(completionHandler: @escaping ((_ films: Array<Film>) -> Void)) {
        let route = self.api.ENDPOINT + EndpointRoutes.FILM.rawValue
        
        self.api.getRequest(route: route, headers: self.api.headers) { (statusCode, data) in
            guard let d = data, statusCode < 300 else { return }
            
            do {
                if let json = (try? JSONSerialization.jsonObject(with: d, options: [])) as? Dictionary<String, Any> {
                    if let results = json["results"] as? Array<Dictionary<String, Any>> {
                        var films = Array<Film>()
                        for result in results {
                            let jsonData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                            let decoder = JSONDecoder()
                            let film = try decoder.decode(Film.self, from: jsonData)
                            films.append(film)
                        }
                        
                        completionHandler(films)
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}
