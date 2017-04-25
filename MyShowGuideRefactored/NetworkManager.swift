//
//  NetworkManager.swift
//  MyShowGuideRefactored
//
//  Created by Justin Doo on 1/16/17.
//  Copyright © 2017 Justin Doo. All rights reserved.
//

import Foundation
import CDAlertView


class NetworkManager: NSObject {
  
  static let sharedManager = NetworkManager()
  
  private let baseURL = "https://api-public.guidebox.com/v1.43/us/rKk09BXyG0kXF1lnde9GOltFq6FfvNQd/"
  
                        
  lazy var configuration: URLSessionConfiguration = URLSessionConfiguration.default
  lazy var session: URLSession = URLSession(configuration: self.configuration)
  
  typealias JSONData = ((Data) -> Void)
  
  
  func getJSONData(urlExtension: String, completion: @escaping JSONData) {
    
    configuration.timeoutIntervalForRequest = 10
    configuration.timeoutIntervalForResource = 10
    
    let request = URLRequest(url: URL(string:"\(baseURL)\(urlExtension)")! )
    
    let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
      
      if error == nil {
        if let httpResponse = response as? HTTPURLResponse {
          switch (httpResponse.statusCode) {
          case 200:
            if let data = data {
              completion(data)
            }
          default:
            print(httpResponse.statusCode)
          }
        }
      } else {
        
        if let error = error {
        print("Error: \(error.localizedDescription)")
          DispatchQueue.main.async {
                  CDAlertView(title: NSLocalizedString("Whoops?", comment: ""), message: NSLocalizedString("Error: \(error.localizedDescription)", comment: ""), type: .error).show()
          }

        SwiftSpinner.hide()
        }
      }
    })
    
    dataTask.resume()
    
  }
  
  
  func parseJSONFromData(_ jsonData: Data?) -> [String : AnyObject]?
  {
    if let data = jsonData {
      
      do {
        let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : AnyObject]//Parses data into a dictionary
        return jsonDictionary
        
      } catch let error as NSError {
        print("error processing json data: \(error.localizedDescription)")
           DispatchQueue.main.async {
        CDAlertView(title: NSLocalizedString("Whoops?", comment: ""), message: NSLocalizedString("Error: \(error.localizedDescription)", comment: ""), type: .error).show()
              }
        SwiftSpinner.hide()
      }
    }
    
    return nil
  }
  
  //In App purchases
  func connectToItunes (searchTerm: String, completion: @escaping JSONData) {
    
    let request = URLRequest(url: URL(string:"https://itunes.apple.com/search?term=\(searchTerm)&at=1001lmK9")! )
    
    // print(request)
    
    let dataTask = session.dataTask(with: request, completionHandler: { (data, response, error) in
      
      if error == nil {
        if let httpResponse = response as? HTTPURLResponse {
          switch (httpResponse.statusCode) {
          case 200:
            if let data = data {
              completion(data)
            }
          default:
            print(httpResponse.statusCode)
          }
        }
      } else {
        
        DispatchQueue.main.async {
          
          if let error = error {
            print("Error: \(error.localizedDescription)")
            CDAlertView(title: NSLocalizedString("Whoops?", comment: ""), message: NSLocalizedString("Error: \(error.localizedDescription)", comment: ""), type: .error).show()
            SwiftSpinner.hide()

          }
          return
        }
      }
    })
    dataTask.resume()
  }
}
