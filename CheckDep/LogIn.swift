//
//  LogIn.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/17/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import UIKit
import Foundation

class LogIn: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var dataJson : [String:Any]?
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userNameField.delegate = self
        passwordField.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController : Balance = segue.destination as! Balance
        destViewController.dataJson = self.dataJson
    
    }
    @IBAction func login(_ sender: UIButton) {
        //testLabel.text = userNameField.text! + passwordField.text!
        //send the username and password to server
        //for authentication!
        
        let userName = userNameField.text!
        let password = passwordField.text!
        let url = URL(string: String("https://protected-everglades-75144.herokuapp.com/authenticateUser.php"))
        var success = false
        
        //generate a request to the server
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let postString = "username=" + userName + "&password=" + password
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                // check for fundamental networking error
                print("Data empty or error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                // check for http errors
                print("statusCode should be 405, but is \(httpStatus.statusCode)")
                print("response from status code = \(response)")
                
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            //let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(responseString!)")
            self.dataJson = json as! [String : Any]?
            print(json!)
            //check if authenticate method returned successfully
            success = (self.dataJson == nil ? true : false)
            
            
        }
        task.resume()

        if success == false {
            performSegue(withIdentifier: "authenticated", sender: self)
        }
    }
//    
//    func readJson() {
//        do {
//            if let file = Bundle.main.url(forResource: "jsonfile", withExtension: "json") {
//                let data = try Data(contentsOf: file)
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                if let object = json as? [String: Any] {
//                    // json is a dictionary
//                    print(object)
//                } else if let object = json as? [Any] {
//                    // json is an array
//                    print(object)
//                } else {
//                    print("JSON is invalid")
//                }
//            } else {
//                print("no file")
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
