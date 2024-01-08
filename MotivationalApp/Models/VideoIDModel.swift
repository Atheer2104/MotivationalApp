//
//  VideoIDModel.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-17.
//

import Foundation

struct startFeed: Codable {
    let nextPageToken: String
    let regionCode: String
    let items: [items]
}

struct feed: Codable {
    let nextPageToken: String
    let prevPageToken: String
    let regionCode: String
    let items: [items]
}

struct items: Codable {
    let etag: String
    let id: id
    let snippet: snippet
}

struct id: Codable {
    let videoId: String
}

struct snippet: Codable {
    let title: String
    let thumbnails: thumbnails
}

struct thumbnails: Codable {
    let medium: medium
}

struct medium: Codable {
    let url: String
}
