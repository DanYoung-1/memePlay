//
//  NetworkManager.swift
//  memePlay
//
//  Created by Daniel Young on 9/21/20.
//

import Foundation
import Combine

protocol MemeServiceProtocol {
    func getMemes() -> AnyPublisher<Welcome, Error>
}

final class MemeService: MemeServiceProtocol {
    private static let url = URL(string: "https://api.imgflip.com/get_memes")!
    
    func getMemes() -> AnyPublisher<Welcome, Error> {
        return URLSession.shared.dataTaskPublisher(for: MemeService.url)
            .map { $0.data }
            .decode(type: Welcome.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
