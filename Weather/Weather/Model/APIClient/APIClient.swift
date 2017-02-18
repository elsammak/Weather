//
//  APIClient.swift
//  Weather
//
//  Created by Mohammed Elsammak on 2/18/17.
//  Copyright © 2017 elsammak. All rights reserved.
//
/// APICLient class is in charge of sending and receiving responses to/from Server
import Foundation
import Alamofire

class APIClient {
    /**
     Request server for JSON response of weather information.
     
     - parameter location: Location that user made a query about.
     
     - returns: Completion blocks contains either data or error.
     */
    public func getWeather(forLocation location: String, _ completion: @escaping Completion) {
        Alamofire.request(serverURL, method: .get, parameters: ["q": location], encoding: URLEncoding.default, headers: nil).validate().responseJSON { response in

            if let JSON = response.result.value {
                completion(JSON as? NSDictionary, nil) // Returns data for parsing
            } else {
                completion(nil, response.error) // Returns error for displaying
            }
        }
    }
}
