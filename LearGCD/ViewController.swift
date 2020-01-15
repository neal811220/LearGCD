//
//  ViewController.swift
//  LearGCD
//
//  Created by Neal on 2020/1/14.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topLocation: UILabel!
    
    @IBOutlet weak var midLocation: UILabel!
    
    @IBOutlet weak var bottomLocation: UILabel!
    
    @IBOutlet weak var topLimit: UILabel!
    
    @IBOutlet weak var midLImit: UILabel!
    
    @IBOutlet weak var bottomLimit: UILabel!
    
    var limit0Data = [RoadDetail]()
    
    var limit1Data = [RoadDetail]()
    
    var limit2Data = [RoadDetail]()
    
    let speedLimit = SpeedLimitAPI()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func clearLabel() {
        topLocation.text = nil
        topLimit.text = nil
        midLocation.text = nil
        midLImit.text = nil
        bottomLocation.text = nil
        bottomLimit.text = nil
    }
    
    @IBAction func pressedGroup(_ sender: UIButton) {
        
        clearLabel()
        
        let group: DispatchGroup = DispatchGroup()
        
        let queue = DispatchQueue(label: "queue")
        
        DispatchQueue.main.async(group: group) {
            group.enter()
            self.speedLimit.getSpeedLimit0Data { (result) in
                switch result {
                case .success(let data):
                    self.limit0Data = data
                    print(data)
                    group.leave()
                    print("Task0")
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        
        DispatchQueue.main.async(group: group) {
            group.enter()
            self.speedLimit.getSpeedLimit1Data { (result) in
                switch result {
                case .success(let data):
                    self.limit1Data = data
                    print(data)
                    group.leave()
                    print("Task1")
                case .failure(let error):
                    print(error)
                    group.leave()
                }
            }
            
            
        }
        
        
        DispatchQueue.main.async(group: group) {
            group.enter()
            self.speedLimit.getSpeedLimit2Data { (result) in
                switch result {
                case .success(let data):
                    
                    self.limit2Data = data
                    print(data)
                    group.leave()
                    print("Task2")
                case .failure(let error):
                    print(error)
                    group.leave()
                }
            }
        }
        
        group.notify(queue: queue) {
            
            DispatchQueue.main.async {
                self.topLocation.text = self.limit0Data[0].road
                self.topLimit.text = self.limit0Data[0].speedLimit
                self.midLocation.text = self.limit1Data[0].road
                self.midLImit.text = self.limit1Data[0].speedLimit
                self.bottomLocation.text = self.limit2Data[0].road
                self.bottomLimit.text = self.limit2Data[0].speedLimit
            }
            
        }
    }
    
    @IBAction func pressedSemaphone(_ sender: UIButton) {
        
         clearLabel()
        
        let sema = DispatchSemaphore(value: 0)
        
        let sema1 = DispatchSemaphore(value: 0)
        
            self.speedLimit.getSpeedLimit0Data { (result) in
                switch result {
                case .success(let data):
                    self.limit0Data = data
                    DispatchQueue.main.async {
                        self.topLocation.text = self.limit0Data[0].road
                        self.topLimit.text = self.limit0Data[0].speedLimit
                    }
                    print(data)
                    print("Task0")
                    sema.signal()
                case .failure(let error):
                    print(error)
                }
            }
        
            sema.wait()
            self.speedLimit.getSpeedLimit1Data { (result) in
                switch result {
                case .success(let data):
                    self.limit1Data = data
                    DispatchQueue.main.async {
                        self.midLocation.text = self.limit1Data[0].road
                        self.midLImit.text = self.limit1Data[0].speedLimit
                    }
                    print(data)
                    print("Task1")
                    sema1.signal()
                case .failure(let error):
                    print(error)
                }
            }
        
        
        
        sema1.wait()
        self.speedLimit.getSpeedLimit2Data { (result) in
            switch result {
            case .success(let data):
                self.limit2Data = data
                DispatchQueue.main.async {
                    self.bottomLocation.text = self.limit2Data[0].road
                    self.bottomLimit.text = self.limit2Data[0].speedLimit
                }
                print(data)
                print("Task2")
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
}
