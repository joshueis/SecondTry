//
//  Balance.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/16/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import UIKit
import Foundation

class Balance: UIViewController {

    @IBOutlet weak var welcomingLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var transactionHistory: UITableView!
    var dataJson : [String: Any]?
    var person = AccountHolder(data: [String : Any](), file: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Checking segue data tr\n")
        print(dataJson)
        print(person?.name)
        
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToMenu(segue: UIStoryboardSegue){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
