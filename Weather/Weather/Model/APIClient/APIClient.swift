//
//  APIClient.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {

    public func getWeather(forLocation location: String, _ completion: @escaping Completion) {
        Alamofire.request(serverURL, method: .get, parameters: ["q": location], encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in

            if let JSON = response.result.value {
                completion(JSON as? NSDictionary, nil)
            } else {
                completion(nil, response.error)
            }
        }
    }
}
