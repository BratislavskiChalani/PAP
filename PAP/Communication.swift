//
//  Communication.swift
//  PAP
//
//  Created by Tadeas Bronis on 02/04/16.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//
//triede su vsetky potrebne funkcie na komunikaciu zo serverom GET,...

import Foundation

//funkcia pre ziskavanie dat zo servera a ich nasledne ulozenie do pola "pubs", aby sme ich nemuseli stale stahovat

let urlString: String = "https://api.backendless.com/v1/data/Pub"
let applicationId: String = "CB726D93-4CCC-6420-FF51-FC1CF6154500"
let secretKey: String = "6C433549-8AD9-E14F-FFB3-C03C5FC53200"

func GETData(){

    let session = NSURLSession.sharedSession()
    let url = NSURL(string: urlString)!
    let request = NSMutableURLRequest(URL: url)
    
    request.setValue(applicationId, forHTTPHeaderField: "application-id")
    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
    
    session.dataTaskWithRequest(request){(data: NSData?,response: NSURLResponse?, error: NSError?) -> Void in
        
        if let responseData = data
        {
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                
                let allJsons = json.valueForKey("data") as! NSArray
                
                for i in allJsons{
                    
                    let actual = i as! Dictionary<String, AnyObject>
                    if let id = actual["objectId"] as? String, let name=actual["name"] as? String, let address=actual["address"] as? String, let phone=actual["phone"] as? String ,let opennigHours=actual["openingHours"] as? String, let photo=actual["photo"] as? String, let rating=actual["rating"] as? Double, let ratingChicks=actual["ratingChicks"] as? Double, let ratingAtmosphere=actual["ratingAtmosphere"] as? Double, let ratingPrices=actual["ratingPrices"] as? Double, let ratingStaff=actual["ratingStaff"] as? Double, let smoking=actual["smoking"] as? Bool{
                        pubs.append(Pub(id: id, name: name, address: address, phone: phone, openningHours: opennigHours, photo: photo, rating: rating, ratingChicks: ratingChicks, ratingAtmosphere: ratingAtmosphere, ratingPrices: ratingPrices, ratingStaff: ratingStaff, smoking: smoking ))
                    }
                }
                
            }catch{
                print("Could not serialize")
            }
        }
        
        }.resume()

}


//Postovanie novych dat na server
func POSTData(name: String, address: String, phone: String, openningHours: String, photo: String, rating: Double, ratingChicks: Double, ratingAtmosphere: Double, ratingPrices: Double, ratingStaff: Double, smoking: Bool){
    
    let session = NSURLSession.sharedSession()
    let url = NSURL(string: urlString)!
    let request = NSMutableURLRequest(URL: url)
    
    request.setValue(applicationId, forHTTPHeaderField: "application-id")
    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
    request.addValue("application/json",forHTTPHeaderField: "Content-Type")
    
    request.HTTPMethod="POST"
    
    let jsonData: Dictionary<String, AnyObject> = ["name": name, "address": address, "phone": phone, "openigHours": openningHours, "photo": photo, "rating": rating, "ratingChicks": ratingChicks, "ratingAtmosphere": ratingAtmosphere, "ratingPrices": ratingPrices, "ratingStaff": ratingStaff, "smoking": smoking]
    //print(jsonData)
    
    request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(jsonData, options: [])
    
    let task = session.dataTaskWithRequest(request) { data, response, error in
        guard data != nil else {
            print("no data found: \(error)")
            return
        }
        
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                print(json)
                let success = json["success"] as? Int
                print("Success: \(success)")
            } else {
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: \(jsonStr)")
            }
        } catch let parseError {
            print(parseError)
            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Error could not parse JSON: '\(jsonStr)'")
        }
        }.resume()
}


func PUTData(objectId: String, name: String, address: String, phone: String, openningHours: String, photo: String, rating: Double, ratingChicks: Double, ratingAtmosphere: Double, ratingPrices: Double, ratingStaff: Double, smoking: Bool){

    let session = NSURLSession.sharedSession()
    let url = NSURL(string: urlString+"/"+objectId)!
    let request = NSMutableURLRequest(URL: url)
    
    request.setValue(applicationId, forHTTPHeaderField: "application-id")
    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
    request.addValue("application/json",forHTTPHeaderField: "Content-Type")
    request.HTTPMethod="PUT"
    
    let jsonData: Dictionary<String, AnyObject> = ["name": name, "address": address, "phone": phone, "openigHours": openningHours, "photo": photo, "rating": rating, "ratingChicks": ratingChicks, "ratingAtmosphere": ratingAtmosphere, "ratingPrices": ratingPrices, "ratingStaff": ratingStaff, "smoking": smoking]
    
    request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(jsonData, options: [])
    
    let task = session.dataTaskWithRequest(request) { data, response, error in
        guard data != nil else {
            print("no data found: \(error)")
            return
        }
        
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                let success = json["success"] as? Int
                print("Success: \(success)")
            } else {
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: \(jsonStr)")
            }
        } catch let parseError {
            print(parseError)
            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Error could not parse JSON: '\(jsonStr)'")
        }
        }.resume()
}

func DELETEData(objectId: String){
    let session = NSURLSession.sharedSession()
    let url = NSURL(string: urlString+"/"+objectId)!
    let request = NSMutableURLRequest(URL: url)
    
    request.setValue(applicationId, forHTTPHeaderField: "application-id")
    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
    request.addValue("application/json",forHTTPHeaderField: "Content-Type")
    request.HTTPMethod="DELETE"
    
    let jsonData = [String: AnyObject]()
    
    request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(jsonData, options: [])
    
    let task = session.dataTaskWithRequest(request) { data, response, error in
        guard data != nil else {
            print("no data found: \(error)")
            return
        }
        
        do {
            if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                let success = json["success"] as? Int
                print("Success: \(success)")
            } else {
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: \(jsonStr)")
            }
        } catch let parseError {
            print(parseError)
            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("Error could not parse JSON: '\(jsonStr)'")
        }
        }.resume()
}


