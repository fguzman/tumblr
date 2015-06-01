//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Francisco Guzman on 5/28/15.
//  Copyright (c) 2015 Francisco Guzman. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate,  UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBar: UIView!
    
    //view controllers
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var currentViewController: UIViewController!
    
    
    //buttons
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    
    @IBOutlet weak var explorePopupView: UIImageView!
    
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tabBar.backgroundColor = tabColor
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! UIViewController
        //composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! UIViewController
        
        
        // Initial view is home
        homeViewController.view.frame = contentView.bounds
        contentView.addSubview(homeViewController.view)
        homeButton.selected = true
        
        // Adding explore popup
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {
            self.explorePopupView.transform = CGAffineTransformMakeTranslation(0, -5)
            }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func onHomeButton(sender: AnyObject) {
        
        if currentViewController != nil {
            hideChildViewController(currentViewController)
        }
        
        
        homeViewController.view.frame = contentView.bounds
        displayContentController(homeViewController)
        currentViewController=homeViewController
        
        homeButton.selected = true
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        explorePopupView.hidden = true
        
        
        //homeView.addSubview(searchViewController.view)
    }
    
    @IBAction func onSearchButton(sender: AnyObject) {
        
        if currentViewController != nil {
            hideChildViewController(currentViewController)
        }
        
        searchViewController.view.frame = contentView.bounds
        displayContentController(searchViewController)
        
        searchButton.selected = true
        homeButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        explorePopupView.hidden = false
        
        //contentView.addSubview(searchViewController.view)
    }

//    @IBAction func onComposeButton(sender: AnyObject) {
//        
//        if currentViewController != nil {
//            hideChildViewController(currentViewController)
//        }
//        
//        composeViewController.view.frame = contentView.bounds
//        displayContentController(composeViewController)
//        
//        explorePopupView.hidden = true
//        
//        //contentView.addSubview(composeViewController.view)
//    }
    
    @IBAction func onAccountButton(sender: AnyObject) {
        
        if currentViewController != nil {
            hideChildViewController(currentViewController)
        }
        
        accountViewController.view.frame = contentView.bounds
        displayContentController(accountViewController)
        
        accountButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false
        explorePopupView.hidden = true
        
        //contentView.addSubview(accountViewController.view)
    }
    
    @IBAction func onTrendingButton(sender: AnyObject) {
        
        if currentViewController != nil {
            hideChildViewController(currentViewController)
        }
        
        trendingViewController.view.frame = contentView.bounds
        displayContentController(trendingViewController)
        
        trendingButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        
        explorePopupView.hidden = true
        
        //contentView.addSubview(trendingViewController.view)
    }
    
    
    func displayContentController(content: UIViewController) {
        addChildViewController(content)
        self.view.addSubview(content.view)
        content.didMoveToParentViewController(self)
    }
    
    func hideChildViewController(content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as! UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
}
