//
//  RoadData.swift
//  LearGCD
//
//  Created by Neal on 2020/1/14.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

struct RoadData: Codable {
    let result: AllResult
}

struct AllResult: Codable {
    
    let limit: Int
    
    let offset: Int
    
    let count: Int
    
    let sort: String
    
    let results: [RoadDetail]
}
struct RoadDetail: Codable {
    
    let functions: String
    
    let area: String
    
    let no: String
    
    let direction: String
    
    let speedLimit: String
    
    let location: String
    
    let id: Int
    
    let road: String
    
    enum CodingKeys: String, CodingKey {
        
        case functions, area, no, direction, location, road
        
        case speedLimit = "speed_limit"
        
        case id = "_id"
    }
}
