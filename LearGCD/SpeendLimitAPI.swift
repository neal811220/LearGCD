//
//  SpeendLimitAPI.swift
//  LearGCD
//
//  Created by Neal on 2020/1/14.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

class SpeedLimitAPI {
   
    func getSpeedLimit0Data(complection: @escaping (Result<[RoadDetail]>) -> Void) {
        
        guard let url = URL(string: "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=5012e8ba-5ace-4821-8482-ee07c147fd0a&limit=1&offset=0") else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let jsondata = data else { return }
            
            do {
                
                let json = try JSONDecoder().decode(RoadData.self, from: jsondata)
                                
                let result = json.result.results
                
                complection(Result.success(result))
                
            } catch {
                
                print(error)
            }
        }
        task.resume()
    }
    
    func getSpeedLimit1Data(complection: @escaping (Result<[RoadDetail]>) -> Void) {
        
        guard let url = URL(string: "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=5012e8ba-5ace-4821-8482-ee07c147fd0a&limit=1&offset=10") else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let jsondata = data else { return }
            
            do {
                
                let json = try JSONDecoder().decode(RoadData.self, from: jsondata)
                                
                let result = json.result.results
                
                complection(Result.success(result))
                
            } catch {
                
                print(error)
            }
        }
        task.resume()
    }
    
    func getSpeedLimit2Data(complection: @escaping (Result<[RoadDetail]>) -> Void) {
        
        guard let url = URL(string: "https://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=5012e8ba-5ace-4821-8482-ee07c147fd0a&limit=1&offset=20") else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            guard let jsondata = data else { return }
            
            do {
                
                let json = try JSONDecoder().decode(RoadData.self, from: jsondata)
                                
                let result = json.result.results
                
                complection(Result.success(result))
                
            } catch {
                
                print(error)
            }
        }
        task.resume()
    }
    
}
