//
//  AccountHolder.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/21/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import Foundation

struct AccountHolder{
    init(json: [String:Any]){
        guard let name = json["name"] as? String,
            let lastName = json["lastName"],
            let id = json["id"],
            let accountJson = json["accounts"]
            let street = json["street"],
            let city = json["city"],
            let state = json["state"],
            
        let mealsJSON = json["meals"] as? [String]
        else {
            return nil
        }
        
        var meals: Set<Meal> = []
        for string in mealsJSON {
            guard let meal = Meal(rawValue: string) else {
                return nil
            }
            
            meals.insert(meal)
        }
        
        self.name = name
        self.coordinates = (latitude, longitude)
        self.meals = meals
    }
    }
    var name :String
    var lastName: String
    var id: NSInteger
    var Account : Account
    var Street :String
    var Street2 : String? = nil
    var City : String //City = "Rexburg"
    var State: String
    var Zipcode : Int{
        switch State {
        case "Idaho":
            return 83440
        case "California":
            return 94682
        default:
            return 00000
        }
    }
    //computed property
    var address : String {
        get {
            let string =
            "Your current address is:\n \(Street)\n \(City) \n \(State)\n \(Zipcode)"
            return string
            
        }
    }
    
}
