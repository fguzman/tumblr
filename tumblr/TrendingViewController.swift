//
//  TrendingViewController.swift
//  tumblr
//
//  Created by Francisco Guzman on 5/30/15.
//  Copyright (c) 2015 Francisco Guzman. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var trendingScrollView: UIScrollView!
    @IBOutlet weak var trendingFeedView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trendingScrollView.contentSize = trendingFeedView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
