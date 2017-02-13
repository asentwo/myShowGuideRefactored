////
////  AllDetailsSowInfo.swift
////  MyShowGuideRefactored
////
////  Created by Justin Doo on 1/22/17.
////  Copyright © 2017 Justin Doo. All rights reserved.
////
//
//import Foundation
//
//
//class DetailShowInfo {
//  
//  var banner : String
//  var overview : String
//  var firstAired : String
//  var network : String
//  var rating : String
//  var poster: String?
//  var artwork: String?
//  var fanart: String?
//  var facebook: String?
//  var twitter: String?
//  var metacritic: String?
//  var imdbID: String?
//  var wiki: NSNumber?
//  var id: NSNumber?
//  
//  
//  init (banner: String, overview: String,firstAired: String, network: String,rating: String,poster: String?, artwork: String?, fanart: String?, facebook: String?, twitter: String?, metacritic: String?,imdbID: String?, wiki: NSNumber?, id: NSNumber?)
//  {
//    self.banner = banner
//    self.overview = overview
//    self.firstAired = firstAired
//    self.network = network
//    self.rating = rating
//    self.poster = poster
//    self.artwork = artwork
//    self.fanart = fanart
//    self.facebook = facebook
//    self.twitter = twitter
//    self.metacritic = metacritic
//    self.imdbID = imdbID
//    self.wiki = wiki
//    self.id = id
//  }
//  
//  init (detailsDictionary: [String: Any]) {
//    
//    banner = detailsDictionary["banner"] as? String ?? ""
//    overview = detailsDictionary["overview"] as? String ?? "N/A"
//    firstAired = detailsDictionary["first_aired"] as? String ?? "N/A"
//    network = detailsDictionary["network"] as? String ?? "N/A"
//    rating = detailsDictionary["rating"] as? String ?? "N/A"
//    poster = detailsDictionary["poster"] as? String ?? "N/A"
//    artwork = detailsDictionary["artwork_608x342"] as? String ?? "N/A"
//    fanart = detailsDictionary["fanart"] as? String ?? "N/A"
//    
//    if let channels = detailsDictionary["channels"] as? [[String:AnyObject]], !channels.isEmpty {
//      let channel = channels[0]
//      let social = channel["social"] as? [String: Any]
//      let facebookDict = social!["facebook"] as? [String:AnyObject]
//      let facebook = nullToNil(facebookDict!["link"]) as? String ?? "N/A"
//      let twitterDict = social!["twitter"] as? [String:AnyObject]
//      let twitter = nullToNil(twitterDict!["link"]) as? String ?? "N/A"
//      
//      metacritic = nullToNil(detailsDictionary["metacritic"] as AnyObject?) as? String
//      imdbID = nullToNil(detailsDictionary["imdb_id"] as AnyObject?) as? String
//      wiki = nullToNil(detailsDictionary["wikipedia_id"] as AnyObject?) as? NSNumber
//      id = nullToNil(detailsDictionary["id"] as AnyObject?) as? NSNumber
//    }
//  }
//  
//  static func updateAllDetails(urlExtension: String -> [String:AnyObject] ){
//    
//        let nm = NetworkManager.sharedManager
//    
//    
//        nm.getJSONData(urlExtension: urlExtension, completion: {
//          data in
//    
//       //   var details = [DetailShowInfo]()
//    
//          if let jsonDictionary = nm.parseJSONFromData(data){
//            
//             do {
//            
//              let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:AnyObject]
//    
//          return jsonResult
//    
//    }
//             catch {
//              return nil
//            }
//    }
//    
//  })
//  }
//  
////  static func updateAllDetails(urlExtension: String, completionHandler:@escaping (_ details: [DetailShowInfo]) -> Void){
////    
////    let nm = NetworkManager.sharedManager
////    
////    
////    nm.getJSONData(urlExtension: urlExtension, completion: {
////      data in
////      
////      var details = [DetailShowInfo]()
////      
////      if let jsonDictionary = nm.parseJSONFromData(data)
////      {
////        let resultsDictionaries = jsonDictionary["results"] as! [String : Any]
////        
////        for resultsDictionary in resultsDictionaries {// enumerate through dictionary
////          let newDetail =  DetailShowInfo(detailsDictionary: resultsDictionary)
////          details.append(newDetail)
////          
////         }
////      }
////      completionHandler(details)
////      
////    })
////  }
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
//}
//
//
//class ExploreInfo {
//  var metacritic: String?
//  var imdbID: String?
//  var wiki: NSNumber?
//  var id: NSNumber?
//  
//  init(metacritic: String?,imdbID: String?, wiki: NSNumber?, id: NSNumber?){
//    self.metacritic = metacritic
//    self.imdbID = imdbID
//    self.wiki = wiki
//    self.id = id
//  }
//  
//}
//
//
