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
    var type : Type
    var balance : NSInteger
    var transactions : [Transaction]
    
}
enum Type : String {
    case Savings, Checking
}
