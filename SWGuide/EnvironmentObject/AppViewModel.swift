//
//  AppViewModel.swift
//  SWGuide
//
//  Created by Pierre on 07/07/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import SwiftUI
import Combine

class AppViewModel: BindableObject {
    let didChange = PassthroughSubject<Void, Never>()
    
    var peoples = Array<PeopleJSON>() {
        didSet {
            didChange.send(())
        }
    }
}
