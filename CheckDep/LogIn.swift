//
//  LogIn.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/17/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import UIKit
import Foundation

class LogIn: UIViewController {

   // let login : LogIn = LogIn(nibName: "LogIn", bundle:nil)
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //var destViewController : ViewController = segue.destination as! ViewController
    
    }
    @IBAction func login(_ sender: UIButton) {
        //testLabel.text = userNameField.text! + passwordField.text!
        //send the username and password to server
        //for authentication!
        let path = "userInterface.php"
        let userName = userNameField.text! //"username="
        let password = passwordField.text! //"password="
        let post = "localhost:8080/" + path
        let url = URL(string: String("https://protected-everglades-75144.herokuapp.com/BankAgents.html"))
        //https://api.ipify.org/?format=json"))
        
        //generate a request to the server
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        //let postString = "username=" + userName + "&password=" + password
        //request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // check for fundamental networking error
                print("Data empty or error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 405 {
                // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response from status code = \(response)")
                
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            print(json)
        }
        task.resume()
      
        
        
//        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
//            guard error == nil else {
//                print(error!)
//                return
//            }
//            guard let data = data else {
//                print("Data is empty")
//                return
//            }
//            
//            let json = try! JSONSerialization.jsonObject(with: data, options: [])
//            print(json)
//        }
//        
//        task.resume()
        if userNameField.text! == "is" {
            performSegue(withIdentifier: "authenticated", sender: self)
        }
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
