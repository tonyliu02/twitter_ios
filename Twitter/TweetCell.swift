//
//  TweetCell.swift
//  Twitter
//
//  Created by Tony Liu on 3/10/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!

    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var retweetBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    
    var favorited: Bool = false
    var tweetID: Int = -1
    
    
    func setFavorite(isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            self.favBtn.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(isRetweeted: Bool) {
        if (isRetweeted) {
            self.retweetBtn.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetBtn.isEnabled = false
        } else {
            self.retweetBtn.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetBtn.isEnabled = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onRetweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetID, success: {
            self.setRetweeted(isRetweeted: true)
        }, failure: { Error in
            print("not working")
        })
    }
    @IBAction func onFav(_ sender: Any) {
        
        if (!favorited) {
            TwitterAPICaller.client?.favTweet(tweetID: tweetID, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { Error in
                print("\(Error)")
            })
        } else {
            TwitterAPICaller.client?.favTweet(tweetID: tweetID, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { Error in
                print("\(Error)")
            })
        }
    }
    
}
