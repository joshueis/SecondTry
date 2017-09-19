//
//  AccountHolder.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/21/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import Foundation

struct AccountHolder{

    var name :String
    
    var id: NSInteger
    var account = Array<Account>()
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
   
    init?(data: [String:Any], file: Bool){
        var json = data
        if file == true
        {
            if let path = Bundle.main.path(forResource: "jsonfile", ofType: "json")
            {
                do {
                    let jsonData = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                    
                    let jsonResult = try? JSONSerialization.jsonObject(with: jsonData.data(using: .utf8)!, options: [])
                    json = jsonResult as! [String : Any]
                    
                    
                } catch let error as NSError {
                    print("Error, \(error)")
                }
            }
        }
        guard let name = json["name"] as? String,
        
            let id = json["id"],
            let accountJson = json["accounts"] as? [[String: Any]],
            let street = json["street"],
            let city = json["city"],
            let state = json["state"]
            
            else {
                return nil
            }
        
        for accountItem in accountJson {
            guard let item = Account(json: accountItem) else {
                return nil
            }
            account.append(item)

        }
        
        self.name = name
      
        self.id = NSInteger(String(describing: id))!
        self.Street = street as! String
        self.City = city as! String
        self.State = state as! String
        print("initializer cmpleted")
    }
        
         //   Account : [Account]//
    
    //computed property
    var address : String {
        get {
            let string =
            "Your current address is:\n \(Street)\n \(City) \n \(State)\n \(Zipcode)"
            return string
            
        }
    }
    
}
