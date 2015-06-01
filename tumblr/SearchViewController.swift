//
//  SearchViewController.swift
//  tumblr
//
//  Created by Francisco Guzman on 5/30/15.
//  Copyright (c) 2015 Francisco Guzman. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var images = UIImage.animatedImageNamed("loading-", duration: 0.5)
        imageView.image = images
        
        delay(1, { () -> () in
            
            self.imageView.stopAnimating()
            self.imageView.hidden = true
    
        })
        
        UIView.animateWithDuration(0.4, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            
            self.backgroundView.alpha = 0
            }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
