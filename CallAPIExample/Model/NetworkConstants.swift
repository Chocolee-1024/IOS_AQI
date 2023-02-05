//
//  NetworkConstants.swift
//  CallAPIExample
//
//  Created by imac-1763 on 2023/2/3.
//

import Foundation



struct NetworkConstants {
    
    static let apiKey = "52a4f010-f65c-4896-89e9-bf818cfec4a1"
    
    static let baseUrl = "https://"
    
    enum APIPath: String{
        case aqi = "data.epa.gov.tw/api/v2/aqx_p_432"
    }
    
    enum APIError: Error{
        case invalidUrl
        
        case unknownError(Error)
        
        case invalidResponse
        
        case jsonDecodeFailed
    }
}

typealias AQIResponseResult = Result<AQIResponse, NetworkConstants.APIError>
