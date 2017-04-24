////
////  TVInfo.swift
////  MrRobotGuide
////
////  Created by Justin Doo on 9/29/15.
////  Copyright © 2015 Justin Doo. All rights reserved.
////
//

//
//  TVInfo.swift
//  MrRobotGuide
//
//  Created by Justin Doo on 9/29/15.
//  Copyright © 2015 Justin Doo. All rights reserved.
//

import Foundation

class DetailShowInfo {
  
  var title : String
  var banner : String
  var overview : String
  var firstAired : String
  var network : String
  var rating : String
  
  
  init (title: String, banner: String, overview: String,firstAired: String, network: String,rating: String)
  {
    self.title = title
    self.banner = banner
    self.overview = overview
    self.firstAired = firstAired
    self.network = network
    self.rating = rating
  }
}


class JustDetailsShowInfo {
  
  var firstAired : String
  var network : String
  var rating : String
  
  
  init (firstAired: String, network: String, rating: String) {
    
    self.firstAired = firstAired
    self.network = network
    self.rating = rating
  }
}


class ArtInfo {
  
  var poster: String?
  var artwork: String?
  var fanart: String?
  
  init (poster: String?, artwork: String?, fanart: String?){
    self.poster = poster
    self.artwork = artwork
    self.fanart = fanart
  }
}


class SocialInfo {
  
  var facebook: String?
  var twitter: String?
  
  init(facebook: String?, twitter: String?){
    
    self.facebook = facebook
    self.twitter = twitter
  }
}


class ExploreInfo {
  var metacritic: String?
  var imdbID: String?
  var wiki: NSNumber?
  var id: NSNumber?
  
  init(metacritic: String?,imdbID: String?, wiki: NSNumber?, id: NSNumber?){
    self.metacritic = metacritic
    self.imdbID = imdbID
    self.wiki = wiki
    self.id = id
  }
}




//import Foundation
//
//class DetailShowInfo {
//  
//  var banner : String?
//  var overview : String?
//  var firstAired : String?
//  var network : String?
//  var rating : String?
//
//  
//  init (banner: String, overview: String,firstAired: String, network: String,rating: String)
//  {
//    self.banner = banner
//    self.overview = overview
//    self.firstAired = firstAired
//    self.network = network
//    self.rating = rating
//  }
//  
//  init (detailsDictionary: [String: Any]) {
//  
//  banner = detailsDictionary["banner"] as? String ?? ""
//  overview = detailsDictionary["overview"] as? String ?? "N/A"
//  firstAired = detailsDictionary["first_aired"] as? String ?? "N/A"
//  network = detailsDictionary["network"] as? String ?? "N/A"
//  rating = detailsDictionary["rating"] as? String ?? "N/A"
//  }
//  
//  
//  static func updateAllDetails(urlExtension: String, completionHandler:@escaping (_ details: [DetailShowInfo]) -> Void){
//    
//    let nm = NetworkManager.sharedManager
//    
//    
//    nm.getJSONData(urlExtension: urlExtension, completion: {
//      data in
//      
//      var details = [DetailShowInfo]()
//      
//      if let jsonDictionary = nm.parseJSONFromData(data)
//      {
//        let resultsDictionaries = jsonDictionary["results"] as! [[String : Any]]
//        for resultsDictionary in resultsDictionaries {// enumerate through dictionary
//          let newDetail =  DetailShowInfo(detailsDictionary: resultsDictionary)
//          details.append(newDetail)
//        }
//      }
//      completionHandler(details)
//      
//    })
//  }
//  
//}
//
//
//class JustDetailsShowInfo {
//  
//  var firstAired : String
//  var network : String
//  var rating : String
//
//  
//  init (firstAired: String, network: String, rating: String) {
//    
//    self.firstAired = firstAired
//    self.network = network
//    self.rating = rating
//  }
//  
//  init (justDetailsDictionary: [String: Any]) {
//    
//    firstAired = justDetailsDictionary["first_aired"] as? String ?? "N/A"
//    network = justDetailsDictionary["network"] as? String ?? "N/A"
//    rating = justDetailsDictionary["rating"] as? String ?? "N/A"
//  }
//  
//  static func updateJustDetails(urlExtension: String, completionHandler:@escaping (_ justDetails: [JustDetailsShowInfo]) -> Void){
//    
//    let nm = NetworkManager.sharedManager
//  
//    nm.getJSONData(urlExtension: urlExtension, completion: {
//      data in
//      
//      var details = [JustDetailsShowInfo]()
//      
//      if let jsonDictionary = nm.parseJSONFromData(data)
//      {
//        let resultsDictionaries = jsonDictionary["results"] as! [[String : Any]]
//        for resultsDictionary in resultsDictionaries {// enumerate through dictionary
//          let newDetail =  JustDetailsShowInfo(justDetailsDictionary: resultsDictionary)
//          details.append(newDetail)
//        }
//      }
//      completionHandler(details)
//      
//    })
//  }
//}
//
//
//class ArtInfo {
//  
//  var poster: String?
//  var artwork: String?
//  var fanart: String?
//  
//  init (poster: String?, artwork: String?, fanart: String?){
//    self.poster = poster
//    self.artwork = artwork
//    self.fanart = fanart
//  }
//  
//  init (artDictionary: [String: Any]) {
//    
//    poster = artDictionary["poster"] as? String ?? "N/A"
//    artwork = artDictionary["artwork_608x342"] as? String ?? "N/A"
//    fanart = artDictionary["fanart"] as? String ?? "N/A"
//  }
//  
//  static func updateArtInfo(urlExtension: String, completionHandler:@escaping (_ arts: [ArtInfo]) -> Void){
//    
//    let nm = NetworkManager.sharedManager
//    
//    nm.getJSONData(urlExtension: urlExtension, completion: {
//      data in
//      
//      var art = [ArtInfo]()
//      
//      if let jsonDictionary = nm.parseJSONFromData(data)
//      {
//        let resultsDictionaries = jsonDictionary["results"] as! [[String : Any]]
//        for resultsDictionary in resultsDictionaries {// enumerate through dictionary
//          let newDetail =  ArtInfo(artDictionary: resultsDictionary)
//          art.append(newDetail)
//        }
//      }
//      completionHandler(art)
//      
//    })
//  }
//  
//  
//}
//
//
//class SocialInfo {
//  
//  var facebook: String?
//  var twitter: String?
//  
//  init(facebook: String?, twitter: String?){
//    
//    self.facebook = facebook
//    self.twitter = twitter
//  }
//  
//  init(socialDictionary: [String: Any]){
//    
//    if let channels = socialDictionary["channels"] as? [[String:AnyObject]], !channels.isEmpty {
//     let channel = channels[0]
//      let social = channel["social"] as? [String: Any]
//      let facebookDict = social!["facebook"] as? [String:AnyObject]
//      let facebook = nullToNil(facebookDict!["link"]) as? String ?? "N/A"
//      let twitterDict = social!["twitter"] as? [String:AnyObject]
//      let twitter = nullToNil(twitterDict!["link"]) as? String ?? "N/A"
//    }
//  }
//  
//  static func updateAllSocialData(urlExtension: String, completionHandler:@escaping (_ socials: [SocialInfo]) -> Void){
//    
//    let nm = NetworkManager.sharedManager
//    
//    nm.getJSONData(urlExtension: urlExtension, completion: {
//      data in
//      
//      var social = [SocialInfo]()
//      
//      if let jsonDictionary = nm.parseJSONFromData(data)
//      {
//        let resultsDictionaries = jsonDictionary["results"] as! [[String : Any]]
//        for resultsDictionary in resultsDictionaries {// enumerate through dictionary
//          let newSocial =  SocialInfo(socialDictionary: resultsDictionary)
//          social.append(newSocial)
//        }
//      }
//      completionHandler(social)
//      
//    })
//  }
//}
//
//
//class ExploreInfo {
//  var metacritic: String?
//  var imdbID: String?
//    var wiki: NSNumber?
//    var id: NSNumber?
//  
//  init(metacritic: String?,imdbID: String?, wiki: NSNumber?, id: NSNumber?){
//    self.metacritic = metacritic
//    self.imdbID = imdbID
//    self.wiki = wiki
//    self.id = id
//  }
//  
//  init (exploreDictionary: [String: Any]){
//    
//    metacritic = nullToNil(exploreDictionary["metacritic"] as AnyObject?) as? String
//    imdbID = nullToNil(exploreDictionary["imdb_id"] as AnyObject?) as? String
//    wiki = nullToNil(exploreDictionary["wikipedia_id"] as AnyObject?) as? NSNumber
//    id = nullToNil(exploreDictionary["id"] as AnyObject?) as? NSNumber
//  }
//  
//  static func updateAllExploreData(urlExtension: String, completionHandler:@escaping (_ explore: [ExploreInfo]) -> Void){
//    
//    let nm = NetworkManager.sharedManager
//    
//    nm.getJSONData(urlExtension: urlExtension, completion: {
//      data in
//      
//      var exploring = [ExploreInfo]()
//      
//      if let jsonDictionary = nm.parseJSONFromData(data)
//      {
//        let resultsDictionaries = jsonDictionary["results"] as! [[String : Any]]
//        for resultsDictionary in resultsDictionaries {// enumerate through dictionary
//          let newExplore =  ExploreInfo(exploreDictionary: resultsDictionary)
//          exploring.append(newExplore)
//        }
//      }
//      completionHandler(exploring)
//      
//    })
//  }
//  
//  
//}
//
//
//
