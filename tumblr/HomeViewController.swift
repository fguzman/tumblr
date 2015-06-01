//
//  HomeViewController.swift
//  tumblr
//
//  Created by Francisco Guzman on 5/30/15.
//  Copyright (c) 2015 Francisco Guzman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.alpha = 0
        loginView.center.y = 600
        emailField.isFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginPress(sender: AnyObject) {
        emailField.becomeFirstResponder()
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.backgroundView.alpha = 0.96
            self.loginView.center.y -= 450
            
            
            }, completion: nil)
    }

    @IBAction func onCancelPress(sender: AnyObject) {
        emailField.resignFirstResponder()
        
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.backgroundView.alpha = 0
            self.loginView.center.y += 450
            
            
            }, completion: nil)
    }
}
