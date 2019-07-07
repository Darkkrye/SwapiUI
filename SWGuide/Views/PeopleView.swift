//
//  PeopleView.swift
//  SWGuide
//
//  Created by Pierre on 07/07/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import SwiftUI

struct PeopleView : View {
    @ObjectBinding var films: Array<FilledPeople>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Characters")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            
            ScrollView {
                HStack {
                    ForEach(appVM.peoples) { people in
                        VStack {
                            URLImage(people.imageURL, placeholder: people.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stoke(Color.gray, lineWidth: 4))
                                .shadow(radius: 5)
                            Text(people.name)
                                .font(.subheadline)
                                .padding(10)
                        }
                    }
                }
            }
        }
    }
}
