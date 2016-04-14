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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageField.text=pubs[actual!]._photo
        nameField.text=pubs[actual!]._name
        addressField.text=pubs[actual!]._address
        phoneField.text=pubs[actual!]._phone
        hoursField.text=pubs[actual!]._openingHours
        smokingSwitch.setOn(pubs[actual!]._smoking, animated:true)
        pricesSlider.setValue(Float(pubs[actual!]._ratingPrices!)/5, animated: true)
        staffSlider.setValue(Float(pubs[actual!]._ratingStaff!)/5, animated: true)
        atmosphereSlider.setValue(Float(pubs[actual!]._ratingAtmosphere!)/5, animated: true)
        chicksSlider.setValue(Float(pubs[actual!]._ratingChicks!)/5, animated: true)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func update(){
    
    
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
