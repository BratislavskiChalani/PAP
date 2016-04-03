//
//  BrowseVC.swift
//  PAP
//
//  Created by Jakub Ďurech on 2.4.2016.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import UIKit

class BrowseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func newButton(sender: AnyObject) {
        self.performSegueWithIdentifier("fromLoginToList", sender: self)
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
