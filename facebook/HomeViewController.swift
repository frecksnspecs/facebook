//
//  HomeViewController.swift
//  facebook
//
//  Created by Sam Huskins on 2/3/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

var selectedImage: UIImageView!

class HomeViewController: UIViewController, UIScrollViewDelegate, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var homeView: UIImageView!
    @IBOutlet weak var homeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var infiniteLoadingIndicator: UIActivityIndicatorView!
    
    var refreshControl: UIRefreshControl!
    var numberOfImagesViews: CGFloat = 1
    
    var imageTransition: ImageTransition!
    var endTransition: CGRect!

    var isPresenting: Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scroll view
        homeScrollView.contentSize = homeView.image!.size
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "onRefresh", forControlEvents: UIControlEvents.ValueChanged)
        homeScrollView.insertSubview(refreshControl, atIndex: 0)
        infiniteLoadingIndicator.center.y = homeView.image!.size.height + 20 + 46
        homeScrollView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
//        homeView.hidden = true
//        homeIndicator.startAnimating()
    }
    
    override func viewDidAppear(animated: Bool) {
//        delay(2) { () -> () in
//            self.homeView.hidden = false
//            self.homeIndicator.stopAnimating()
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func onRefresh() {
        delay(2) { () -> () in
            self.refreshControl.endRefreshing()
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
        
    }
    
    @IBAction func photoDidTap(sender: UITapGestureRecognizer) {
        selectedImage = sender.view as! UIImageView
        
//        print(selectedImage.image)

        performSegueWithIdentifier("PhotoDetailSegue", sender: self)


        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as! PhotoDetailViewController
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self

//        destinationViewController.photoImageView.image = selectedImage.image
        
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    private func configureImageTransition(imageTransition: ImageTransition) {
        let window = UIApplication.sharedApplication().keyWindow!
        let initialImageFrame = window.convertRect(selectedImage.frame, fromView: homeScrollView)
        
        imageTransition.duration = 0.5
        imageTransition.selectedImageView = selectedImage
        imageTransition.initialImageFrame = initialImageFrame
    }

    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//        print("animating transition")
        let containerView = transitionContext.containerView()!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
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
