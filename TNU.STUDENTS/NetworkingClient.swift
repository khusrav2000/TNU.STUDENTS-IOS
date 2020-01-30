//
//  NetworkingClient.swift
//  TNU.STUDENTS
//
//  Created by mac on 1/29/20.
//  Copyright © 2020 Istiqlol Soft. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient {
    
    typealias WebServiceResponseAuth = ([String: Any]?, Error?) -> Void
    typealias WebServiceResponseProfile = (StudentsInfo?, Error?) -> Void
    
    func auth(token: String, login: String , password: String, completion: @escaping WebServiceResponseAuth){
        
        guard let url = URL(string: "http://77.95.1.55:7575/api/v1/auth") else {
            return
        }
        
        let headers: HTTPHeaders = ["token": token]
        let parameters = ["login": login, "password": password]
        
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers ).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonDict = response.result.value as? [String: Any] {
                //let token = jsonDict["message"] as! String
                //print(token)
                completion(jsonDict, nil)
            }
        }
        
    }
    
    func getProfile(token: String, completion: @escaping WebServiceResponseProfile){
        
        guard let url = URL(string: "http://77.95.1.55:7575/api/v1/student/profile") else {
            return
        }
        
        let headers: HTTPHeaders = ["token": token]
        
        Alamofire.request(url, method: .get, headers: headers ).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let result = response.data {
                let jsonDecoder = JSONDecoder()
                do {
                    let studentInfo = try jsonDecoder.decode(StudentsInfo.self, from: result)
                    completion(studentInfo, nil)
                } catch let error {
                    completion(nil, error)
                }
            }
        
        }
    }
}
