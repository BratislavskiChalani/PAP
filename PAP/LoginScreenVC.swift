//
//  LoginScreenVC.swift
//  PAP
//
//  Created by Jakub Ďurech on 31.3.2016.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import UIKit

class LoginScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    //button na prechod- daj vyskakovacie okno if wrong pass
    @IBAction func actionButtonLogin(sender: AnyObject) {
        
        //if ((userNameField.text == "ahoj@cau.sk") && (passwordField.text == "heslo"))
        //{
        self.performSegueWithIdentifier("fromLoginToList", sender: self)
        //}
        
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
