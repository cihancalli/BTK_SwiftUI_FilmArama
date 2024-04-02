//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Cihan on 19.03.2024.
//

import SwiftUI

struct DetayView: View {
    let imdbId : String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack {
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(height: UIScreen.main.bounds.height * 0.67)
                .ignoresSafeArea(.all)
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "")
                .font(.largeTitle)
                .padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Loading...")
                .padding()
            
           
            
            Spacer()
        }.onAppear(perform: {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId )
        })
    }
}

#Preview {
    DetayView(imdbId: "tt0120338")
}
