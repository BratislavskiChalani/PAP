//
//  ServerCommunication.swift
//  PAP
//
//  Created by Tadeas Bronis on 15/03/16.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import Foundation

let APP_ID = "CB726D93-4CCC-6420-FF51-FC1CF6154500"
let SECRET_KEY = "6C433549-8AD9-E14F-FFB3-C03C5FC53200"
let VERSION_NUM = "v1"

var backendless = Backendless.sharedInstance()

class Pub : NSObject{
    var name:String?
    var address:String?
    var phone:String?
    var openingHours:String?
    var photo:String?
    var rating:Int?
    var ratingChicks:Double?
    var ratingAtmosphere:Double?
    var ratingPrices:Double?
    var ratingStaff:Double?
    var smoking:BooleanType = true
}


func saveNewPub(){
    
    let pub = Pub()
    pub.name="U prijebaneho peta"
    pub.address="Pajzel 8, Bratislava"
    pub.phone="07807373"
    pub.rating=4
    pub.smoking=false
    
    let DataStore = backendless.data.of(Pub.ofClass())
    
    DataStore.save(
        
        pub,
        response: {(result: AnyObject!) -> Void in
            let obj = result as! Pub
            print("Pub bol ulozeny\n")
        },
        error: {(fault: Fault!) -> Void in
            print("Nieco sa dojebalo\n")
    })
}


func findContactsAsync() {
    
    let dataStore = backendless.data.of(Pub.ofClass())
    
    dataStore.find(
        { (result: BackendlessCollection!) -> Void in
            let pub = result.getCurrentPage()
            for obj in pub {
                var obc = Pub()
                obc = obj as! Pub
                deleteContactAsync(obc)
                print("\(obc.name)")
            }
        },
        error: { (fault: Fault!) -> Void in
            print("Server reported an error: \(fault)")
    })
}


func updateContactAsync(pub:Pub) {
    let dataStore = Backendless.sharedInstance().data.of(Pub.ofClass())
    
    // update object asynchronously
    pub.name = "Supermanova krcma"
    pub.phone = "212-555-5555"
    dataStore.save(
        pub,
        response: { (result: AnyObject!) -> Void in
            let updatedContact = result as! Pub
            print("Contact has been updated")
        },
        error: { (fault: Fault!) -> Void in
            print("Server reported an error (2): \(fault)")
    })
}


func deleteContactAsync(pub:Pub) {
    
    let dataStore = backendless.data.of(Pub.ofClass())
    
            dataStore.remove(
                pub,
                response: { (result: AnyObject!) -> Void in
                    print("Pub has been deleted: \(result)")
                },
                error: { (fault: Fault!) -> Void in
                    print("Server reported an error (2): \(fault)")
            })
    
}


