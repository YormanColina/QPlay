//
//  VideoUrl.swift
//  QPlay
//
//  Created by Apple on 13/07/22.
//

import Foundation
import ObjectMapper

struct VideoUrl: Mappable {
    var mobile: String = ""
    var tablet: String = ""
    
    init() {}
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        mobile <- map ["mobile"]
        tablet <- map ["tablet"]
    }
}
