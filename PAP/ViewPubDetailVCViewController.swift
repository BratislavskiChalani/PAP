//
//  ViewPubDetailVCViewController.swift
//  PAP
//
//  Created by Jakub Ďurech on 13.4.2016.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import UIKit
import MapKit



class ViewPubDetailVCViewController: UIViewController, MKMapViewDelegate,  CLLocationManagerDelegate {

    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var smokingLabel: UILabel!
    @IBOutlet weak var entranceImage: UIImageView!
    @IBOutlet weak var rating: UIImageView!
    @IBOutlet weak var ratingPrices: UIImageView!
    @IBOutlet weak var ratingStaff: UIImageView!
    @IBOutlet weak var ratingAtmosphere: UIImageView!
    @IBOutlet weak var ratingChicks: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ACTUAL: "+String(actual))
        
        
        print("star"+String(round(actual._ratingAtmosphere!)))
        self.title=actual._name
        entranceImage.image=actual._image
        addressLabel.text=actual._address
        phoneLabel.text=actual._phone
        hoursLabel.text=actual._openingHours
        if actual._smoking{
            smokingLabel.text="FAJČÁRSKE"
        }
        else{
            smokingLabel.text="SILNO NEFAJČÁRSKE"
        }
        
        
        ratingPrices.image = UIImage(named: "star"+String(round(actual._ratingPrices!)))
        ratingStaff.image = UIImage(named: "star"+String(round(actual._ratingStaff!)))
        ratingAtmosphere.image = UIImage(named: "star"+String(round(actual._ratingAtmosphere!)))
        ratingChicks.image = UIImage(named: "star"+String(round(actual._ratingChicks!)))
        
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

}
