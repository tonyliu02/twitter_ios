//
//  TweetViewController.swift
//  Twitter
//
//  Created by Tony Liu on 3/14/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var tweetTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onTweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { Error in
                print("there is an error \(Error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
