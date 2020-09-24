//
//  GetMemesResponse.swift
//  memePlay
//
//  Created by Daniel Young on 9/21/20.
//

import Foundation

// MARK: - GetMemesResponse
struct Welcome: Codable {
    let success: Bool
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Codable, Identifiable, Hashable {
    let id, name: String
    let url: String
    let width, height, boxCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, url, width, height
        case boxCount = "box_count"
    }
}



