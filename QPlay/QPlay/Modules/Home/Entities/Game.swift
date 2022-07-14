//
//  Game.swift
//  QPlay
//
//  Created by Apple on 13/07/22.
//

import Foundation
import ObjectMapper

struct Game: Mappable {
    var title: String = ""
    var studio: String = ""
    var contentRaiting: String = ""
    var publicationYear: String = ""
    var description: String = ""
    var platforms: [String] = []
    var tags: [String] = []
    var videosUrls: VideoUrl = VideoUrl()
    var galleryImages: [String] = []
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        title <- map ["title"]
        studio <- map ["studio"]
        contentRaiting <- map ["contentRaiting"]
        publicationYear <- map ["publicationYear"]
        description <- map ["description"]
        platforms <- map ["platforms"]
        tags <- map ["tags"]
        videosUrls  <- map ["videosUrls"]
        galleryImages <- map ["galleryImages"]
    }
    
}
