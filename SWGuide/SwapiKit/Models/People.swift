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
//  People.swift
//  
//
//  Created by Pierre on 07/07/2019.
//

import Foundation
import UIKit
import SwiftUI

public class FilledPeople: NSObject, Identifiable {
    public var id: Int
    
    var name: String
    var birthYear: String
    var eyeColor: String
    var gender: String
    var hairColor: String
    var height: String
    var mass: String
    var skinColor: String
    /*var homeworld: Planet?
    var films: Array<Film>?
    var species: Array<Specy>?
    var starships: Array<Starship>?
    var vehicles: Array<Vehicle>?*/
    var url: String
    var created: String
    var edited: String
    var image = UIImage(named: "DefaultCharacter")!
    var imageURL: URL
    
    public init(json: People) {
        self.name = json.name
        self.birthYear = json.birth_year
        self.eyeColor = json.eye_color
        self.gender = json.gender
        self.hairColor = json.hair_color
        self.height = json.height
        self.mass = json.mass
        self.skinColor = json.skin_color
        /*self.homeworld = Planet()
        self.films = Array<Film>()
        self.species = Array<Specy>()
        self.starships = Array<Starship>()
        self.vehicles = Array<Vehicle>()*/
        self.url = json.url
        self.created = json.created
        self.edited = json.edited
        self.id = ModelHelpers.getIdFrom(url: self.url)
        self.imageURL = URL(string: "https://starwars-visualguide.com/assets/img/characters/\(self.id).jpg")!
    }
}

public class People: NSObject, Decodable {
    var name: String
    var birth_year: String
    var eye_color: String
    var gender: String
    var hair_color: String
    var height: String
    var mass: String
    var skin_color: String
    var homeworld: String
    var films: Array<String>
    var species: Array<String>
    var starships: Array<String>
    var vehicles: Array<String>
    var url: String
    var created: String
    var edited: String
    
    public init(name: String, birth_year: String, eye_color: String, gender: String, hair_color: String, height: String, mass: String, skin_color: String, homeworld: String, films: Array<String>, species: Array<String>, starships: Array<String>, vehicles: Array<String>, url: String, created: String, edited: String) {
        self.name = name
        self.birth_year = birth_year
        self.eye_color = eye_color
        self.gender = gender
        self.hair_color = hair_color
        self.height = height
        self.mass = mass
        self.skin_color = skin_color
        self.homeworld = homeworld
        self.films = films
        self.species = species
        self.starships = starships
        self.vehicles = vehicles
        self.url = url
        self.created = created
        self.edited = edited
    }
}
