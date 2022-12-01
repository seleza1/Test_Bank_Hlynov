//
//  Model.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.

import Foundation

struct GetBiography: Decodable {
    let artist: Artist
}

struct Artist: Decodable {
    let bio: Bio
    let name: String
}

struct Bio: Decodable {
    let summary: String
}

