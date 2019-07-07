//
//  AppViewModel.swift
//  SWGuide
//
//  Created by Pierre on 07/07/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import SwiftUI
import Combine

public class AppViewModel: BindableObject {
    let sk = SwapiKit()
    
    public let didChange = PassthroughSubject<Void, Never>()
    
    public var peoples = Array<FilledPeople>() {
        didSet {
            didChange.send(())
        }
    }
    
    public var films = Array<FilledFilm>() {
        didSet {
            didChange.send(())
        }
    }
    
    init() {
        sk.peopleService.getFilledPeoples { (peoples) in
            DispatchQueue.main.async {
                self.peoples = peoples
            }
        }
        
        sk.filmService.getFilledFilms { (films) in
            DispatchQueue.main.async {
                self.films = films
            }
        }
    }
}
