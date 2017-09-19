//
//  Transaction.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/21/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import Foundation

struct Transaction{
    var date : String
    var ammount : NSInteger
    var description : String
    init?(json:[String:String]){
        guard let date = json["date"],
            let ammount = json["ammount"],
            let description = json["description"]
            
            else {
                return nil
        }
        self.date = date
        self.ammount = NSInteger(ammount)!
        self.description = description
    }

}
