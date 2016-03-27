//
//  Tweet.swift
//  Twitter
//
//  Created by mac on 3/24/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var text: NSString?
    var timestamp: NSDate!
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var username: NSString?
    var screenName: NSString?
    var profileImageUrl: NSURL?
    var nameArray: NSDictionary?
    //var imageUrl: String?
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        
//        nameArray = dictionary["user"] as? NSDictionary
//        username = nameArray!["name"] as? String
        username = dictionary["user"]!["name"] as? String
        screenName = dictionary["user"]!["screen_name"] as? String
        let timestampString = dictionary["created_at"] as? String
        
        let imageURLString = dictionary["user"]!["profile_image_url_https"] as? String
        
        //imageUrl = imageURLString!
        if imageURLString != nil {
            profileImageUrl = NSURL(string: imageURLString!)!
        } else {
            profileImageUrl = nil
        }
        
        
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
    }
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }
    
}
