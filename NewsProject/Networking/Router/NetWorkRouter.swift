//
//  NetWorkRouter.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
public typealias NetworkRouterCompletion = (_ data:Data?,_ response:URLResponse?,_ error: Error?)->()


protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}
