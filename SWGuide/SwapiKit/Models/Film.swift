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
//  Film.swift
//  
//
//  Created by Pierre on 07/07/2019.
//

import Foundation
import UIKit
import SwiftUI

public class FilledFilm: NSObject, Identifiable {
    public var id: Int
    
    var title: String
    var episodeId: Int
    var openingCrawl: String
    var director: String
    var producer: String
    /*var releaseDate: Date
    var species: Array<Specy>
    var starships: Array<Starship>
    var vehicles: Array<Vehicle>
    var characters: Array<People>
    var planets: Array<Planet>*/
    var url: String
    var created: String
    var edited: String
    var image = UIImage(named: "DefaultCharacter")!
    var imageURL: URL
    
    public init(json: Film) {
        self.title = json.title
        self.episodeId = json.episode_id
        self.openingCrawl = json.opening_crawl
        self.director = json.director
        self.producer = json.producer
        /*self.releaseDate = json.release_date
        self.species = json.species
        self.starships = json.starships
        self.vehicles = json.vehicles
        self.characters = json.characters
        self.planets = json.planets*/
        self.url = json.url
        self.created = json.created
        self.edited = json.edited
        self.id = ModelHelpers.getIdFrom(url: self.url)
        self.imageURL = URL(string: "https://starwars-visualguide.com/assets/img/films/\(self.id).jpg")!
    }
}

public class Film: NSObject, Decodable {
    var title: String
    var episode_id: Int
    var opening_crawl: String
    var director: String
    var producer: String
//    var release_date: Date
    var species: Array<String>
    var starships: Array<String>
    var vehicles: Array<String>
    var characters: Array<String>
    var planets: Array<String>
    var url: String
    var created: String
    var edited: String
    
    public init(title: String, episode_id: Int, opening_crawl: String, director: String, producer: String, release_date: Date, species: Array<String>, starships: Array<String>, vehicles: Array<String>, characters: Array<String>, planets: Array<String>, url: String, created: String, edited: String) {
        self.title = title
        self.episode_id = episode_id
        self.opening_crawl = opening_crawl
        self.director = director
        self.producer = producer
//        self.release_date = release_date
        self.species = species
        self.starships = starships
        self.vehicles = vehicles
        self.characters = characters
        self.planets = planets
        self.url = url
        self.created = created
        self.edited = edited
    }
}
