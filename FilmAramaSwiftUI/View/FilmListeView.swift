//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Cihan on 19.03.2024.
//

import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmlisteViewModel : FilmListeViewModel
    
    @State var aranacakFilm = "titanic"
    
    init () {
        self.filmlisteViewModel = FilmListeViewModel()
      
    }
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Aranacak Film", text: $aranacakFilm, onEditingChanged:{ _ in
                    
                }, onCommit: {
                    self.filmlisteViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmlisteViewModel.filmler, id: \.imdbId) { film in
                    
                    NavigationLink {
                        DetayView(imdbId: film.imdbId)
                    } label: {
                        HStack {
                            OzelImage(url: film.poster)
                                .frame(width: 90,height: 130)
                            
                            VStack(alignment:.leading){
                                Text(film.title)
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                
                                Text(film.year)
                                    .foregroundColor(.orange)
                            }
                            
                        }
                    }

                    
                }.navigationTitle(Text("Film Kitabı"))
                
            }
            
        }
    }
}

#Preview {
    FilmListeView()
}
