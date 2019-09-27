//
//  EndPointType.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
public enum NewsApi {
    case getList
}
extension NewsApi:EndPointType {
    var path: String {
        return ""
    }
    
    var httpMethod : HTTPMethods {
        switch self {
        case .getList:
            return .get
        }
    }
    
    var baseURL: URL {
        switch self {
        case .getList:
            return URL(string: "https://newsapi.org/v2/everything?q=apple&from=2019-09-26&to=2019-09-26&sortBy=popularity&apiKey=151cdb8ad6d341218135cddb2cfc503b")!
        }
      
    }
    
    var task : HTTPTask? {
        switch self {
        case .getList:
            return .request
            
        }
    }
    
    var header : HTTPHeaders? {
        return nil
    }
}
