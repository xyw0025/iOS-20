//
//  ContentView.swift
//  Lab08
//
//  Created by Wen Hsin-Yu on 2020/5/6.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let movies = movieData
    var body: some View {
        NavigationView{
            List(movies) { movie in
                NavigationLink(destination: MovieDetail(movie: movie)) {
                    MovieRow(movie: movie)
                }
            }
            .navigationBarTitle("Movie List")
        }    
    }
}
struct MovieRow: View {
    let movie: Movie
    var body: some View {
        HStack {
            Image(movie.title)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            VStack(alignment: .leading) {
                Text(movie.title)
                Text(movie.language)
            }
            Spacer()
        }
    }

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
