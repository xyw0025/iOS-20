//
//  MovieDetail.swift
//  Lab08
//
//  Created by Wen Hsin-Yu on 2020/5/6.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    let movie: Movie
    var body: some View {
        VStack {
            Image(movie.title)
                .resizable()
                .scaledToFill()
                //                .frame(height: 300)
                .clipped()
                .padding()
            Text(movie.date)
            .font(.subheadline)

        }
        .padding()
        .navigationBarTitle(movie.title)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: movieData[0])

    }
}
