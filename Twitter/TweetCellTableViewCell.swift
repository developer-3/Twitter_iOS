//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Adam Anderson on 2/17/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    var liked: Bool = false
    var tweetId: Int = -1
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    
    @IBAction func retweet(_ sender: Any) {
        
        
        
    }
    
    @IBAction func likeTweet(_ sender: Any) {
        let toBeFavorited = !liked
        
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                    print("Favorite did not succeed: \(Error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("Unfavorite did not succeed \(Error)")
            })
        }
    }
    
    func setFavorite (_ isFavorited: Bool) {
        liked = isFavorited
        if (liked) {
            likeButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            likeButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
