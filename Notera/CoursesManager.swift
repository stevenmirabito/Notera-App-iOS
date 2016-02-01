//
//  CoursesManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CoursesManager {
        
    var delegate: AsyncRequestDelegate?
    var courses = [Course]()
        
    func getCoursesForUser() {
        Alamofire.request(.GET, "https://api.notera.xyz/courses")
            .responseJSON { response in
                if response.result.isSuccess {
                    if let data: AnyObject = response.result.value! {
                        let array = JSON(data).arrayValue
                        self.courses = array.map {
                            Course(json: $0)
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
        getCoursesForUser()
    }
    
}