//
//  SettingsViewController.swift
//  facebook
//
//  Created by Sam Huskins on 2/3/16.
//  Copyright © 2016 Sam Huskins. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsScrollView: UIScrollView!
    @IBOutlet weak var settingsImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsScrollView.contentSize=settingsImageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func logoutDidPress(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Incorrect Login", message: "Please enter your email and password again", preferredStyle: .ActionSheet)
        let logoutAction = UIAlertAction(title: "Log out", style: .Destructive) {(action) in
            self.performSegueWithIdentifier("logoutSegue", sender: nil)
        }
        
        // add the cancel action to the alertController
        alertController.addAction(logoutAction)
        
        // create an OK action
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) {
        }

        
    }

}
