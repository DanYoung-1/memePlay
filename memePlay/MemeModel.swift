//
//  MemeModel.swift
//  memePlay
//
//  Created by Daniel Young on 9/21/20.
//

import Foundation
import Combine

final class MemeModel: ObservableObject {
    
    @Published var memes = [Meme]()
    
    private var cancellable: AnyCancellable?
    
    init(memeService: MemeServiceProtocol) {
        self.cancellable = memeService.getMemes()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
            }) { welcome in
                self.memes = welcome.data.memes
            }
    }
}
