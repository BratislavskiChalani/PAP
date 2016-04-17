//
//  Pub.swift
//  PAP
//
//  Created by Tadeas Bronis on 02/04/16.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//
//Deklarovanie noveho typu Pub
//Obsahuje vsetky potrebne argumenty k konkretnemu Pub-u
//Mame tu inicializovane aj pole, kde budu ulozene vsetky aktualne Pub-y, ktore su v nasej databaze



import Foundation
import UIKit

var pubs=[Pub]()
var actual: Pub!

class Pub : NSObject{
    var _id:String?
    var _name:String?
    var _address:String?
    var _phone:String?
    var _openingHours:String?
    var _photo:String?
    var _rating:Double?
    var _ratingChicks:Double?
    var _ratingAtmosphere:Double?
    var _ratingPrices:Double?
    var _ratingStaff:Double?
    var _smoking:Bool = true
    var _image: UIImage!
    
    init(id: String, name: String, address: String, phone: String, openningHours: String, photo: String,rating: Double, ratingChicks: Double, ratingAtmosphere: Double, ratingPrices: Double, ratingStaff: Double, smoking: Bool) {
        _id=id
        _name=name
        _address=address
        _phone=phone
        _openingHours=openningHours
        _photo=photo
        _rating=rating
        _ratingChicks=ratingChicks
        _ratingAtmosphere=ratingAtmosphere
        _ratingPrices=ratingPrices
        _ratingStaff=ratingStaff
        _smoking=smoking
        
        let url = NSURL(string: photo)
        let data = NSData(contentsOfURL: url!)
        _image=UIImage(data: data!)
        print("Pridane: "+name)
    }
}


func parseDATA(data: NSData){
    
    do{
        let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
        print(json)
        
        let allJsons = json.valueForKey("data") as! NSArray
        
        for i in allJsons{
            
            let actual = i as! Dictionary<String, AnyObject>
            if let id = actual["objectId"] as? String, let name=actual["name"] as? String, let address=actual["address"] as? String, let phone=actual["phone"] as? String ,let opennigHours=actual["openningHours"] as? String, let photo=actual["photo"] as? String, let rating=actual["rating"] as? Double, let ratingChicks=actual["ratingChicks"] as? Double, let ratingAtmosphere=actual["ratingAtmosphere"] as? Double, let ratingPrices=actual["ratingPrices"] as? Double, let ratingStaff=actual["ratingStaff"] as? Double, let smoking=actual["smoking"] as? Bool{
                pubs.append(Pub(id: id, name: name, address: address, phone: phone, openningHours: opennigHours, photo: photo, rating: rating, ratingChicks: ratingChicks, ratingAtmosphere: ratingAtmosphere, ratingPrices: ratingPrices, ratingStaff: ratingStaff, smoking: smoking ))
            }
        }
        
    }catch{
        print("Could not serialize")
    }
}
