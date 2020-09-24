//
//  ContentView.swift
//  memePlay
//
//  Created by Daniel Young on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var memeModel = MemeModel(memeService: MemeService())
    
    var body: some View {
        VStack {
            ForEach(memeModel.memes, id: \.self) { meme in
                Text(meme.name)
            }
            Text("stuff")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
