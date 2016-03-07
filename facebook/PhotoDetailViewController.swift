//
//  PhotoDetailViewController.swift
//  facebook
//
//  Created by Sam Huskins on 3/6/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    
    let backgroundViewColor = UIColor(white: 0, alpha: 1)
    var currentImageViewIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = selectedImage.image

        backgroundView.backgroundColor = backgroundViewColor
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1600, height: 1000)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneTap(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetFade = 1 - (scrollView.contentOffset.y / -60)
        
        doneButton.alpha = offsetFade
        backgroundView.alpha = offsetFade
//        photoActionsView.alpha = offsetFade
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y < -100 {
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return photoImageView
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
