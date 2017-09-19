//
//  Account.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/21/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import Foundation

struct Account{
    var id : NSInteger
    var type : String
    var balance : NSInteger
    var transactions = Array<Transaction>()
   
    init?(json:[String:Any]){
        guard let type = json["type"] as? String,
            let id = json["id"],
            let balance = json["balance"],
            let transactionsJson = json["transactions"] as? [[String: Any]]
        
            else {
                return nil
        }
        for transactionJson in transactionsJson {//as! Array<[String: Any]>{
            guard let transaction = Transaction(json: transactionJson as! [String : String]) else {
                return nil
            }
            self.transactions.append(transaction)

        }
        self.balance = balance as! NSInteger
        self.id = id as! NSInteger
        self.type = type 
    }
}
