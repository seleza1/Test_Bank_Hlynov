//
//  ModelsBestTrack.swift
//  Test_Bank_Hlynov
//
//  Created by user on 29.11.2022.
//

import Foundation

struct GetResponse: Decodable {
    let toptracks: TopTracks
}

struct TopTracks: Decodable {
    let track: [Track]
}

struct Track: Decodable {
    let name: String
}
