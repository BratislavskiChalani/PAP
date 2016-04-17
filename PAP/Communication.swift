//
//  Communication.swift
//  PAP
//
//  Created by Tadeas Bronis on 02/04/16.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//
//triede su vsetky potrebne funkcie na komunikaciu zo serverom GET,...

import Foundation
import Alamofire

//funkcia pre ziskavanie dat zo servera a ich nasledne ulozenie do pola "pubs", aby sme ich nemuseli stale stahovat

var urlString: String = "https://api.backendless.com/v1/data/Pub"
let applicationId: String = "CB726D93-4CCC-6420-FF51-FC1CF6154500"
let secretKey: String = "6C433549-8AD9-E14F-FFB3-C03C5FC53200"

var headers = ["application-id" : "CB726D93-4CCC-6420-FF51-FC1CF6154500",
               "secret-key" : "6C433549-8AD9-E14F-FFB3-C03C5FC53200"]


func getData(category: Int, completition: (data: AnyObject) -> Void) {
    var url = "https://api.backendless.com/v1/data/Pub?pageSize=100"
    if category != 0 {
        url=url + "&where=category%3D"+String(category)
    }
    Alamofire.request(.GET,url, encoding : .JSON,headers: headers).responseJSON { response  in
            parseDATA(response.data!)
            completition(data: response.data!)
        }
    //TODO OFFSET
}

func postData(name: String, address: String, phone: String, openningHours: String, photo: String, rating: Double, ratingChicks: Double, ratingAtmosphere: Double, ratingPrices: Double, ratingStaff: Double, smoking: Bool,completition : (data : AnyObject)-> Void) {
    
    let jsonData: Dictionary<String, AnyObject> = ["name": name, "address": address, "phone": phone, "openningHours": openningHours, "photo": photo, "rating": rating, "ratingChicks": ratingChicks, "ratingAtmosphere": ratingAtmosphere, "ratingPrices": ratingPrices, "ratingStaff": ratingStaff, "smoking": smoking]
    
    Alamofire.request(.POST, urlString, parameters: jsonData, encoding: .JSON, headers: headers).responseJSON { response in
     
        print(response.result.value)
        completition(data: response.result.value!)
    }

//TODO HANDLE DATA
}

func putData(objectId: String, name: String, address: String, phone: String, openningHours: String, photo: String, rating: Double, ratingChicks: Double, ratingAtmosphere: Double, ratingPrices: Double, ratingStaff: Double, smoking: Bool,completition : (data : AnyObject)-> Void) {
    
//TODO HANDLE DATA
    let jsonData: Dictionary<String, AnyObject> = ["name": name, "address": address, "phone": phone, "openningHours": openningHours, "photo": photo, "rating": rating, "ratingChicks": ratingChicks, "ratingAtmosphere": ratingAtmosphere, "ratingPrices": ratingPrices, "ratingStaff": ratingStaff, "smoking": smoking]
    let url = urlString + "/" + objectId
    print(url)
    Alamofire.request(.PUT, url, parameters: jsonData, encoding: .JSON, headers: headers).responseJSON { response in
        
        print(response.result.value)
        completition(data: response.result.value!)
    }
    
}

func deleteData(objectId : String, completition : (data : AnyObject)-> Void) {
    
    let url = urlString + "/" + objectId
    print(url)
    let jsonData = [String: AnyObject]()
   
    Alamofire.request(.DELETE, url, parameters: jsonData, encoding: .JSON, headers: headers).responseJSON { response in
        
        print(response.result.value)
        completition(data: response.result.value!)
    }
}

//func GETData(completion: (data: NSData?) -> Void ){
//
//    urlString = "https://api.backendless.com/v1/data/Pub?pageSize=10&offset="+String(offset)
//    let session = NSURLSession.sharedSession()
//    let url = NSURL(string: urlString)!
//    let request = NSMutableURLRequest(URL: url)
//    
//    request.setValue(applicationId, forHTTPHeaderField: "application-id")
//    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
//    
//    let task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?,response: NSURLResponse?, error: NSError?) in
//        
//        if let responseData = data
//        {
//            parseDATA(responseData)
//            
//            completion(data: responseData)
//        }
//        
//        })
//
//    task.resume()
//
//    offset+=(pubs.count-offset)
//    urlString = "https://api.backendless.com/v1/data/Pub"
//}


//Postovanie novych dat na server
//func POSTData(name: String, address: String, phone: String, openningHours: String, photo: String, rating: Double, ratingChicks: Double, ratingAtmosphere: Double, ratingPrices: Double, ratingStaff: Double, smoking: Bool){
//    
//    let session = NSURLSession.sharedSession()
//    let url = NSURL(string: urlString)!
//    let request = NSMutableURLRequest(URL: url)
//    
//    request.setValue(applicationId, forHTTPHeaderField: "application-id")
//    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
//    request.addValue("application/json",forHTTPHeaderField: "Content-Type")
//    
//    request.HTTPMethod="POST"
//    
//    let jsonData: Dictionary<String, AnyObject> = ["name": name, "address": address, "phone": phone, "openningHours": openningHours, "photo": photo, "rating": rating, "ratingChicks": ratingChicks, "ratingAtmosphere": ratingAtmosphere, "ratingPrices": ratingPrices, "ratingStaff": ratingStaff, "smoking": smoking]
//    //print(jsonData)
//    
//    request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(jsonData, options: [])
//    
//    let task = session.dataTaskWithRequest(request) { data, response, error in
//        guard data != nil else {
//            print("no data found: \(error)")
//            return
//        }
//        
//        do {
//            if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
//                print(json)
//                let success = json["success"] as? Int
//                print("Success: \(success)")
//            } else {
//                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                print("Error could not parse JSON: \(jsonStr)")
//            }
//        } catch let parseError {
//            print(parseError)
//            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("Error could not parse JSON: '\(jsonStr)'")
//        }
//        }.resume()
//    urlString = "https://api.backendless.com/v1/data/Pub"
//}

//
//func PUTData(objectId: String, name: String, address: String, phone: String, openningHours: String, photo: String, rating: Double, ratingChicks: Double, ratingAtmosphere: Double, ratingPrices: Double, ratingStaff: Double, smoking: Bool){
//
//    let session = NSURLSession.sharedSession()
//    let url = NSURL(string: urlString+"/"+objectId)!
//    let request = NSMutableURLRequest(URL: url)
//    
//    request.setValue(applicationId, forHTTPHeaderField: "application-id")
//    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
//    request.addValue("application/json",forHTTPHeaderField: "Content-Type")
//    request.HTTPMethod="PUT"
//    
//    let jsonData: Dictionary<String, AnyObject> = ["name": name, "address": address, "phone": phone, "opennigHours": openningHours, "photo": photo, "rating": rating, "ratingChicks": ratingChicks, "ratingAtmosphere": ratingAtmosphere, "ratingPrices": ratingPrices, "ratingStaff": ratingStaff, "smoking": smoking]
//    
//    request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(jsonData, options: [])
//    
//    let task = session.dataTaskWithRequest(request) { data, response, error in
//        guard data != nil else {
//            print("no data found: \(error)")
//            return
//        }
//        
//        do {
//            if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
//                let success = json["success"] as? Int
//                print("Success: \(success)")
//            } else {
//                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                print("Error could not parse JSON: \(jsonStr)")
//            }
//        } catch let parseError {
//            print(parseError)
//            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("Error could not parse JSON: '\(jsonStr)'")
//        }
//        }.resume()
//    urlString = "https://api.backendless.com/v1/data/Pub"
//}
//
//func DELETEData(objectId: String){
//    let session = NSURLSession.sharedSession()
//    let url = NSURL(string: urlString+"/"+objectId)!
//    let request = NSMutableURLRequest(URL: url)
//    
//    request.setValue(applicationId, forHTTPHeaderField: "application-id")
//    request.setValue(secretKey, forHTTPHeaderField: "secret-key")
//    request.addValue("application/json",forHTTPHeaderField: "Content-Type")
//    request.HTTPMethod="DELETE"
//    
//    let jsonData = [String: AnyObject]()
//    
//    request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(jsonData, options: [])
//    
//    let task = session.dataTaskWithRequest(request) { data, response, error in
//        guard data != nil else {
//            print("no data found: \(error)")
//            return
//        }
//        
//        do {
//            if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
//                let success = json["success"] as? Int
//                print("Success: \(success)")
//            } else {
//                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                print("Error could not parse JSON: \(jsonStr)")
//            }
//        } catch let parseError {
//            print(parseError)
//            let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print("Error could not parse JSON: '\(jsonStr)'")
//        }
//        }.resume()
//    
//    offset=0
//    urlString = "https://api.backendless.com/v1/data/Pub"
//}


