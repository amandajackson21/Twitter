//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Amanda Jackson on 2/19/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetsLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favCount: UILabel!
    
    @IBAction func retweetTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweetTweet(tweetId: tweetId, success: {
            self.setRetweet(true)
        }, failure: { (error) in
            print("Retweet did not succeed: \(error)")
        })
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorited(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    var favorited:Bool = false
    var tweetId: Int = -1
    
    func setRetweet (_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-green"), for: UIControl.State.normal)
            retweetCount.textColor = UIColor.green
            retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named: "retweet"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    func setFavorited (_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favorite-red"), for: UIControl.State.normal)
            favCount.textColor = UIColor.red
            
            let fCount = self.favCount.text
            var counter = 0
            
            if(fCount == ""){
                counter = 1
            }
            else{
                let temp = Int(fCount!)
                counter = temp! + 1
            }
            self.favCount.text = String(counter)
            
        }
        else {
            favButton.setImage(UIImage(named: "favorite"), for: UIControl.State.normal)
            favCount.textColor = UIColor.lightGray
            
            var fCount = self.favCount.text
            var counter = 0
            var temp = 1
            
            if (fCount == ""){
                temp = 1
            }else {
                temp = Int(fCount!)!
            }
            fCount = ""
            if (temp != 1){
                counter = temp - 1
                fCount = String(counter)
            }
            self.favCount.text = fCount
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.roundedImage()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
