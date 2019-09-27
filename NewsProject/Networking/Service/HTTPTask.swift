//
//  HTTPTask.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
public enum HTTPTask {
    
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?,method:HTTPMethods)
    
    case requestFormURL(bodyParameters: Parameters?, additionHeaders: HTTPHeaders?, method: HTTPMethods)
    
}
