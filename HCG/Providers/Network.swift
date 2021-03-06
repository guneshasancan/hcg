//
//  Network.swift
//  HCG
//
//  Created by Hasan Can on 28.02.2021.
//

import Foundation
import Alamofire
import UIKit

fileprivate struct Constant {
    static let timeoutInterval: TimeInterval = 10
}

class Network {
    
    static let shared = Network()
    
    //GET Method
    func get(_ url: String, params: [String:String]?, withHeader: Bool, completion: @escaping (_ parsedJSON: JSON?, _ statusCode: Int?, _ error: Error?) -> Void) {
        
        let headers: HTTPHeaders = HTTPHeaders(getAuthorizationHeader())
        
        AF.session.configuration.timeoutIntervalForRequest = Constant.timeoutInterval
        AF.session.configuration.timeoutIntervalForResource = Constant.timeoutInterval
        
        AF.request(url, method: .get, parameters: params ?? nil, headers: withHeader ? headers : nil).responseJSON { (response) in
            
            switch response.result {
            case .success:
                if let value = response.value, let statusCode = response.response?.statusCode {
                    let parsedJson = JSON(value)
                    print(statusCode)
                    completion(parsedJson, statusCode, nil)
                }
            case .failure(let error):
                if let statusCode = response.response?.statusCode {
                    print("Error = \(statusCode)")
                    completion(nil, statusCode, error)
                }
            }
        }
        
    }
    
    //MARK: -Get Bearer Token
    func getAuthorizationHeader() -> [String: String] {
//        let token = UserDefaults.standard.string(forKey: "Authorization") ?? ""
        return ["Content-Type" : "application/json",
                "Authorization" : "Bearer 0L2IIzaXSvbjxyL8TR3EgiUzYEskAG"]
    }
    
    
}



