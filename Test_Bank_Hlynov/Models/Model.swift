//
//  Model.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.

import Foundation

// MARK: - Welcome
struct Welcome: Decodable {
    let artist: WelcomeArtist
}

// MARK: - WelcomeArtist
struct WelcomeArtist: Decodable {
    let name: String
    let mbid: String
    let url: String
    let image: [Image]
    let streamable, ontour: String
    let stats: Stats
    let similar: Similar
    let tags: Tags
    let bio: Bio
}

// MARK: - Bio
struct Bio: Decodable, Encodable {
    let links: Links
    let published, summary, content: String
}

// MARK: - Links
struct Links: Decodable, Encodable {
    let link: Link
}

// MARK: - Link
struct Link: Decodable, Encodable {
    let text, rel: String
    let href: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case rel, href
    }
}

// MARK: - Image
struct Image: Codable {
    let text: String
    let size: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

// MARK: - Similar
struct Similar: Codable {
    let artist: [ArtistElement]
}

// MARK: - ArtistElement
struct ArtistElement: Codable {
    let name: String
    let url: String
    let image: [Image]
}

// MARK: - Stats
struct Stats: Codable {
    let listeners, playcount: String
}

// MARK: - Tags
struct Tags: Codable {
    let tag: [Tag]
}

// MARK: - Tag
struct Tag: Codable {
    let name: String
    let url: String
}
