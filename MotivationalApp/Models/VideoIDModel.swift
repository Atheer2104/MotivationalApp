//
//  VideoIDModel.swift
//  MotivationalApp
//
//  Created by atheer on 2020-10-17.
//

import Foundation

struct feed: Codable {
    let nextPageToken: String
    let regionCode: String
    let items: [items]
}

struct items: Codable {
    let etag: String
    let id: id
}

struct id: Codable {
    let videoId: String
}
