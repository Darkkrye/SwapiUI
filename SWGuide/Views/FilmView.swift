//
//  FilmView.swift
//  SWGuide
//
//  Created by Pierre on 07/07/2019.
//  Copyright © 2019 Pierre. All rights reserved.
//

import SwiftUI

struct FilmView : View {
    @ObjectBinding var films: Array<FilledFilm>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Films")
                .font(.title)
                .fontWeight(.bold)
                .padding(10)
            
            ScrollView {
                HStack {
                    ForEach(films) { film in
                        VStack {
                            URLImage(film.imageURL)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 250)
                                .cornerRadius(5)
                                .shadow(radius: 5)
                                .padding(10)
                            Text(film.title)
                                .font(.subheadline)
                                .padding(10)
                                .lineLimit(Int.max)
                        }
                    }
                }
            }
        }
    }
}
