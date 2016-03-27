//
//  StatusTwitterViewCell.swift
//  Twitter
//
//  Created by mac on 3/26/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class StatusTwitterViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    var user: User! {
        didSet {
            nameLabel.text = user.name as? String
            profileImage.setImageWithURL(user.profileUrl!)
            screenNameLabel.text = user.screenname as? String
        }
    }
    var tweet: Tweet! {
        didSet {
            commentLabel.text = tweet.text as? String
            nameLabel.text = tweet.username as? String
            screenNameLabel.text = tweet.screenName as? String
            profileImage.setImageWithURL(tweet.profileImageUrl!)
            timeLabel.text = timeAgoSinceDate(tweet.timestamp, numericDates: true)
            //timeLabel.text = tweet.timestamp as? String
        }
    }
    
//            thumbImageView.setImageWithURL(business.imageURL!)
//            categorisLabel.text = business.categories
//            addressLabel.text = business.address
//            reviewsCountLabel.text = "\(business.reviewCount!) Reviews"
//            ratingImageView.setImageWithURL(business.ratingImageURL!)
//            distanceLabel.text = business.distance
//

    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = 5
        profileImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
