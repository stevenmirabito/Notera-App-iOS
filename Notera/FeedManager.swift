//
//  PostsManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class FeedManager {
    
    var delegate: AsyncRequestDelegate?
    var notes = [Note]()
    
    func getFeedForUser() {
        Alamofire.request(.GET, "https://api.notera.xyz/feed/stevenmirabito")
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
    
    init() {
        self.delegate = nil
        getFeedForUser()
    }
}