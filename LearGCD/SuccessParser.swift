//
//  SuccessParser.swift
//  LearGCD
//
//  Created by Neal on 2020/1/14.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

struct SuccessParser<T: Codable>: Codable {
    
    let data: T
    
    enum Codingkeys: String, CodingKey {
        
        case data
    }
}
