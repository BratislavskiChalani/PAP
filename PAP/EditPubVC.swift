//
//  EditPubVC.swift
//  PAP
//
//  Created by Jakub Ďurech on 13.4.2016.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import UIKit

class EditPubVC: UIViewController {
    
    @IBOutlet weak var imageField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var hoursField: UITextField!
    @IBOutlet weak var smokingSwitch: UISwitch!
    @IBOutlet weak var pricesSlider: UISlider!
    @IBOutlet weak var staffSlider: UISlider!
    @IBOutlet weak var atmosphereSlider: UISlider!
    @IBOutlet weak var chicksSlider: UISlider!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.title = "SAVE"
        
        imageField.text=actual._photo
        nameField.text=actual._name
        addressField.text=actual._address
        phoneField.text=actual._phone
        hoursField.text=actual._openingHours
        smokingSwitch.setOn(actual._smoking, animated:true)
        pricesSlider.setValue(Float(actual._ratingPrices!)/5, animated: true)
        staffSlider.setValue(Float(actual._ratingStaff!)/5,
                             animated: true)
        atmosphereSlider.setValue(Float(actual._ratingAtmosphere!)/5, animated: true)
        chicksSlider.setValue(Float(actual._ratingChicks!)/5, animated: true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveNewData(sender: AnyObject) {
        
        putData(actual._id! , name: nameField.text!, address: addressField.text!, phone: phoneField.text!, openningHours: hoursField.text!, photo: imageField.text!, rating: actual._rating!, ratingChicks: Double(chicksSlider.value), ratingAtmosphere: Double(atmosphereSlider.value), ratingPrices: Double(pricesSlider.value), ratingStaff: Double(staffSlider.value), smoking: smokingSwitch.on){ data in
            
            let alertController = UIAlertController(title: "Alert", message:
                "Your edited data was successfully saved", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("NavigationController")
            self.presentViewController(nextViewController, animated:true, completion:nil)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func deletePub(sender: AnyObject) {
        deleteData(actual._id!)
        { data in
        
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("NavigationController")
            self.presentViewController(nextViewController, animated:true, completion:nil)
            
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
