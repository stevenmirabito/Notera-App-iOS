//
//  SchoolManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SchoolManager {
    
    var delegate: AsyncRequestDelegate?
    var schools = [School]()
    
    func getSchools() {
        Alamofire.request(.GET, "https://api.notera.xyz/schools")
            .responseJSON { response in
                if response.result.isSuccess {
                    if let data: AnyObject = response.result.value! {
                        let array = JSON(data).arrayValue
                        self.schools = array.map {
                            School(json: $0)
                        }
                    }
                }
                
                if let delegate = self.delegate {
                    delegate.dataLoadedCallback()
                }
        }
    }
    
    init() {
        self.delegate = nil
        getSchools()
    }
    
}