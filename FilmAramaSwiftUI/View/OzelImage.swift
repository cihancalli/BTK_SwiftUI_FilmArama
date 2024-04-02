//
//  OzelImage.swift
//  FilmAramaSwiftUI
//
//  Created by Cihan on 19.03.2024.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url:String) {
        self.url  = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            return Image("10")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    OzelImage(url: "https://m.media-amazon.com/images/M/MV5BMTMxMjQ1MjA5Ml5BMl5BanBnXkFtZTcwNjIzNjg1Mw@@._V1_SX300.jpg")
}
