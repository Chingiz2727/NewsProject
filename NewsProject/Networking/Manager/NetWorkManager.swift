//
//  NetWorkManager.swift
//  NewsProject
//
//  Created by Shyngys Kuandyk on 9/27/19.
//  Copyright © 2019 Shyngys Kuandyk. All rights reserved.
//

import Foundation
enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}
enum NetworkEnvironment {
    case qa
    case production
    case staging
}
struct NetworkManager {
    func getNews(completion:@escaping(_ error:String?,_ module:NewsModule?)->()) {
        router.request(.getList) { (data, response, error) in
             if error != nil {
                                      completion("Пожалуйста проверьте соединение с интернетом",nil)
                                  }
                                  
                                  if let response = response as? HTTPURLResponse {
                                      let result = self.handleNetworkResponse(response)
                                      switch result {
                                      case.success:
                                          guard let responseData = data else {
                                              completion(NetworkResponse.noData.rawValue,nil)
                                              return
                                              
                                          }
                                          do {
                                              print("respnseDatas")
                                              print(responseData)
                                              let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                                              print(jsonData)
                                              let apiResponse = try JSONDecoder().decode(NewsModule.self, from: responseData)
                                              completion(nil,apiResponse)
                                          }catch {
                                              print(error)
                                              completion( NetworkResponse.unableToDecode.rawValue,nil)
                                          }
                                      case .failure(let networkFailureError):
                                          print(networkFailureError)
                                          
                                          completion(networkFailureError,nil)
                                          
                                      }
                                  }
        }
        
    }
    
let router = Router<NewsApi>()
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
