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
    }
}

var pubs=[Pub]()
