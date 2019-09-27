//
//  Errors.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
public enum NetworkError : String,Error {
    case parametresNil = "Parametres were Nil"
    case encodingFailed = "Parameter encoding Faile"
    case missingURL = "MissingURL"
}
