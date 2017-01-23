//
//  ChannelCell.swift
//  GuideBoxGuide2.0
//
//  Created by Justin Doo on 2/9/16.
//  Copyright © 2016 Justin Doo. All rights reserved.
//

import UIKit


class ChannelInfo: NSObject {
  
  var logo: String?
  var channelName: String?
  var id: NSNumber?
  
  
  init(logo: String, channelName: String , id: NSNumber) {
    
    self.logo = logo
    self.channelName = channelName
    self.id = id
  }
  
  init(resDictionary: [String:Any]) {
    
    logo = resDictionary["artwork_608x342"] as? String
    channelName = resDictionary["name"] as? String
    id = resDictionary["id"] as? NSNumber
    
  }
  
  
  static func updateAllChannels(urlExtension: String, completionHandler:@escaping (_ channels: [ChannelInfo]) -> Void){
    
    let nm = NetworkManager.sharedManager
    
    
    nm.getJSONData(urlExtension: urlExtension, completion: {
      data in
      
      var channels = [ChannelInfo]()
      
      if let jsonDictionary = nm.parseJSONFromData(data)
      {
        let resultsDictionaries = jsonDictionary["results"] as! [[String : Any]]
        for resultsDictionary in resultsDictionaries {// enumerate through dictionary
          let newChannel = ChannelInfo(resDictionary: resultsDictionary)
          channels.append(newChannel)
        }
      }
      completionHandler(channels)
      
    })
  }
}


class ChannelCell : UICollectionViewCell {
  
  @IBOutlet var channelImageView: UIImageView!
  
}
