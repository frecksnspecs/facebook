//
//  LoginViewController.swift
//  facebook
//
//  Created by Sam Huskins on 2/10/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var labelParentView: UIView!
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    var initialLogoY: CGFloat!
    var logoOffset: CGFloat!
    var initialLabelY: CGFloat!
    var labelOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY = fieldParentView.frame.origin.y
        offset = -50
        initialLogoY = logoView.frame.origin.y
        logoOffset = -20
        initialLabelY = labelParentView.frame.origin.y
        
        loginButton.enabled = false
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        fieldParentView.frame.origin.y = initialY + offset
        logoView.frame.origin.y = initialLogoY + logoOffset
        labelParentView.frame.origin.y = initialLabelY - frame.size.height
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialY
        logoView.frame.origin.y = initialLogoY
        labelParentView.frame.origin.y = initialLabelY
        
    }
    
    @IBAction func didTap(sender: AnyObject) {
        view.endEditing(true)
        
    }

    @IBAction func loginDidTap(sender: AnyObject) {
        self.activityIndicatorView.startAnimating()
        loginButton.selected = true

        let alertController = UIAlertController(title: "Incorrect Login", message: "Please enter your email and password again", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) {(action) in
            // handle cancel response here. doing nothing will dismiss view
        }
        
        // add the cancel action to the alertController
        alertController.addAction(cancelAction)
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)

        
        
        if emailTextField.text == "z@lyft.com" && passwordTextField.text == "123" {
            delay(2) { () -> () in
                self.activityIndicatorView.stopAnimating()
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        } else {
            delay(2) { () -> () in

            self.activityIndicatorView.stopAnimating()
            
            self.presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            }

            
        }
    }
    
    
    @IBAction func emailDidChange(sender: AnyObject) {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
            loginButton.enabled = false
        } else {
            loginButton.enabled = true
        }
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
