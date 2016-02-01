//
//  CourseFeedManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/31/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CourseFeedManager {
    
    var delegate: AsyncRequestDelegate?
    var notes = [Note]()
    
    func getFeedForCourse(courseId: Int) {
        Alamofire.request(.GET, "https://api.notera.xyz/course/" + String(courseId) + "/notes")
            .responseJSON { response in
                if response.result.isSuccess {
                    if let data: AnyObject = response.result.value! {
                        let array = JSON(data).arrayValue
                        self.notes = array.map {
                            Note(json: $0)
                        }
                    }
                }
                
                if let delegate = self.delegate {
                    delegate.dataLoadedCallback()
                }
        }
    }
    
    init(courseId: Int) {
        self.delegate = nil
        getFeedForCourse(courseId)
    }
}