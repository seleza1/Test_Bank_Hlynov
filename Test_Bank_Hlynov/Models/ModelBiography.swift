//
//  Model.swift
//  Test_Bank_Hlynov
//
//  Created by user on 28.11.2022.

import Foundation

// MARK: - Tracks
struct Tracks: Decodable {
    let artist: TracksArtist
}

// MARK: - TracksArtist
struct TracksArtist: Decodable {
    let name, mbid: String
    let url: String
    let image: [Image]
    let streamable: String
    let ontour: String
    let stats: Stats
    let similar: Similar
    let tags: Tags
    let bio: Bio
}

// MARK: - Bio
struct Bio: Decodable {
    let links: Links
    let published: String
    let summary: String
    let content: String
}

// MARK: - Links
struct Links: Decodable {
    let link: Link
}

// MARK: - Link
struct Link: Decodable {
    let text: String
    let rel: String
    let href: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case rel, href
    }
}

// MARK: - Image
struct Image: Decodable {
    let text: String
    let size: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

// MARK: - Similar
struct Similar: Decodable {
    let artist: [ArtistElement]
}

// MARK: - ArtistElement
struct ArtistElement: Decodable {
    let name: String
    let url: String
    let image: [Image]
}

// MARK: - Stats
struct Stats: Decodable {
    let listeners: String
    let playcount: String
}

// MARK: - Tags
struct Tags: Decodable {
    let tag: [Tag]
}

// MARK: - Tag
struct Tag: Decodable {
    let name: String
    let url: String
}

