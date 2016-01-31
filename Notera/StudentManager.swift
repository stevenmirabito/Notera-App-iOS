//
//  ClassmatesManager.swift
//  Notera
//
//  Created by Steven Mirabito on 1/30/16.
//  Copyright © 2016 Notera. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class StudentManager {
    
    var delegate: AsyncRequestDelegate?
    var classmates = [Student]()
    
    func getClassmates() {
        Alamofire.request(.GET, "https://api.notera.xyz/classmates/stevenmirabito")
            .responseJSON { response in
                if response.result.isSuccess {
                    if let data: AnyObject = response.result.value! {
                        let array = JSON(data).arrayValue
                        self.classmates = array.map {
                            Student(json: $0)
                        }
                    }
                }
                 
                if let delegate = self.delegate {
                    delegate.dataLoadedCallback()
                }
        }
    }
    
    func getStudentById(studentId: Int) -> Student? {
        if let index = classmates.indexOf({$0.id == studentId}) {
            return classmates[index]
        } else {
            return nil
        }
    }
    
    init() {
        self.delegate = nil
        getClassmates()
    }
    
}