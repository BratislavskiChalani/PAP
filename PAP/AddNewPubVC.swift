//
//  AddNewPubVC.swift
//  PAP
//
//  Created by Jakub Ďurech on 2.4.2016.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import UIKit

class AddNewPubVC: UIViewController {
    @IBOutlet weak var pubName: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var openningHours: UITextField!
    @IBOutlet weak var smoking: UISwitch!
    
    @IBOutlet weak var imageUrl: UITextField!
    @IBOutlet weak var ratingPrices: UISlider!
    @IBOutlet weak var ratingStaff: UISlider!
    @IBOutlet weak var ratingAtmosphere: UISlider!
    @IBOutlet weak var ratingChicks: UISlider!

    @IBOutlet weak var rating: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
        // Get the new view controller using segue.destinationViewControlle
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveData(sender: AnyObject) {
        let ratingPrices: Double = Double(self.ratingPrices.value)
        let ratingStaff: Double = Double(self.ratingStaff.value)
        let ratingAtmosphere: Double = Double(self.ratingAtmosphere.value)
        let ratingChicks: Double = Double(self.ratingChicks.value)
        
        let rating: Double = (ratingPrices+ratingStaff+ratingAtmosphere+ratingChicks)/5
        
        postData( pubName.text!, address: address.text!, phone: phone.text!, openningHours: openningHours.text!, photo: imageUrl.text!, rating: rating, ratingChicks: ratingChicks, ratingAtmosphere: ratingAtmosphere, ratingPrices: ratingPrices, ratingStaff: ratingStaff, smoking: smoking.on){ data in
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("NavigationController")
            self.presentViewController(nextViewController, animated:true, completion:nil)
        }
    }
}























