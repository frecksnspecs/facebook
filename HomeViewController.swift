//
//  HomeViewController.swift
//  facebook
//
//  Created by Sam Huskins on 2/3/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var homeScrollView: UIScrollView!
    @IBOutlet weak var homeView: UIImageView!
    @IBOutlet weak var homeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var infiniteLoadingIndicator: UIActivityIndicatorView!
    
    var selectedImage: UIImageView!
    var refreshControl: UIRefreshControl!
    var numberOfImagesViews: CGFloat = 1
    
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
        
        print(selectedImage.image)

        performSegueWithIdentifier("PhotoDetailSegue", sender: self)

        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as! PhotoDetailViewController
        
        
        print(destinationViewController)
//        destinationViewController.photoImageView.image = selectedImage.image
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
