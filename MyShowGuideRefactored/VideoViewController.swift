//
//  videoViewController.swift
//  MyShowGuideRefactored
//
//  Created by Justin Doo on 4/12/16.
//  Copyright © 2016 Justin Doo. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  //MARK: Constants
  var task : URLSessionTask?
  var videoArray:[String]?
  var videoInfoArray:[String]?
  var spinnerActive = false
  var showToVideo: NSNumber = 0
  let nm = NetworkManager.sharedManager
  
  @IBOutlet weak var videoTableView: UITableView!
  

  //MARK: ViewDidLoad
  override func viewDidLoad() {
    
    nm.getJSONData(urlExtension: "show/\(showToVideo)/clips/all/0/25/all/all/true", completion: {
    
    data in
      
      self.updateDetailShowInfo(data)
    
    
    })
    
  }
  
  //MARK: JSON
  
  func updateDetailShowInfo (_ data: Data!) {
    do {

      let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
      
      if let results = jsonResult["results"] as? [[String:AnyObject]], !results.isEmpty {
        
        videoArray = []
        
        for result in results {
          if let freeIOSServices = result["free_ios_sources"] as? [[String:AnyObject]], !results.isEmpty {
                      let free = freeIOSServices[0]
                      let videoView = free["embed"] as? String
                      print("\(videoView!)")
                      videoArray?.append(videoView!)
          }
        }
    }
      
    } catch {
      showNetworkError()
    }
    
    DispatchQueue.main.async {
      self.videoTableView.reloadData()
    }
   }
  
  

  //MARK: TableView
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videoArray!.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell") as! VideoCell
    SwiftSpinner.hide()
    spinnerActive = false
    let localVideoURL = videoArray![indexPath.row]
    cell.videoInfoLabel.text = videoInfoArray![indexPath.row]
    
    cell.videoWebView.loadHTMLString("<iframe width=\"560\" height=\"315\" src=\"\(localVideoURL)\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
    return cell
  }
  //MARK: Network Error Indicator
  
  func showNetworkError () {
    let alert = UIAlertController(title: NSLocalizedString("Whoops?", comment: ""), message: NSLocalizedString("There was a connection error. Please try again.", comment: ""), preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: {_ in _ = self.navigationController?.popViewController(animated: true)})
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
  }
}
