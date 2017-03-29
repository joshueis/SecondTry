//
//  ViewController.swift
//  CheckDep
//
//  Created by Israel Carvajal on 3/16/17.
//  Copyright © 2017 Israel Carvajal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let balanceView : Balance = Balance  (nibName: "Balance", bundle:nil)
        let checkView : CheckView = CheckView(nibName: "CheckView", bundle:nil)
       // let login : LogIn = LogIn(nibName: "LogIn", bundle:nil)
        
        //add the views to the scroll view
        //self.addChildViewController(login)
        //self.scrollView.addSubview(login.view)
        //login.didMove(toParentViewController: self)
        
        self.addChildViewController(balanceView)
        self.scrollView.addSubview(balanceView.view)
        balanceView.didMove(toParentViewController: self)
        
        self.addChildViewController(checkView)
        self.scrollView.addSubview(checkView.view)
        checkView.didMove(toParentViewController: self)
        
        //set up the positioning of the views
        var balanceFrame: CGRect = balanceView.view.frame
        balanceFrame.origin.x = self.view.frame.width
        balanceView.view.frame = balanceFrame

        var checkFrame: CGRect = checkView.view.frame
        checkFrame.origin.x = self.view.frame.width * 2
        checkView.view.frame = checkFrame
        
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 2, height: self.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

