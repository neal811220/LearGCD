//
//  HTTPClinet.swift
//  LearGCD
//
//  Created by Neal on 2020/1/14.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

enum Result<T> {
    
    case success(T)
    
    case failure(Error)
}

enum HTTPClinetError: Error {
    
    case decodeDataFail
    
    case clinetError(Data)
    
    case severError
    
    case unexpectedError
}

enum HTTPMethod: String {
    
    case GET
    
    case POST
}
