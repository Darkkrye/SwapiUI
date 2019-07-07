//
//  ContentView.swift
//  SWGuide
//
//  Created by Pierre on 07/07/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import SwiftUI
import URLImage

struct ContentView : View {
    @EnvironmentObject var appVM: AppViewModel
    
    var body: some View {
        VStack {
            Text("Hello, World")
        }
    }
}
