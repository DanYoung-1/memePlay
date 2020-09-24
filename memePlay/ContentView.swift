//
//  ContentView.swift
//  memePlay
//
//  Created by Daniel Young on 9/21/20.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @ObservedObject var memeModel = MemeModel(memeService: MemeService())
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(memeModel.memes, id: \.self) { meme in
                    VStack {
                        Text(meme.name)
                        URLImage(URL(string: meme.url)!) { proxy in
                            proxy.image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
