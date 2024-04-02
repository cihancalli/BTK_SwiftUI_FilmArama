//
//  FilmDetayViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Cihan on 19.03.2024.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModel?
    
    let doenloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId:String) {
        doenloaderClient.filmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case.success(let filmDetay):
                DispatchQueue.main.sync {
                    self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
                }
            }
        }
    }
}


struct FilmDetaylariViewModel {
    let detay : FilmDetayModel
    
    var title : String {
        detay.title
    }
    
    var poster : String {
        detay.poster
    }
    
    var year : String {
        detay.year
    }
    
    var imdbId : String {
        detay.imdbId
    }
    
    var director : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var plot : String {
        detay.plot
    }
}
