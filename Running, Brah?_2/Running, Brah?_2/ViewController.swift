//
//  ViewController.swift
//  Running, Brah?_2
//
//  Created by Stacy Kam on 10/15/16.
//  Copyright © 2016 Stacy Kam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputMiles: UILabel!
    @IBOutlet weak var currentMiles: UILabel!
    @IBOutlet weak var totalMiles: UILabel!
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
        totalMiles.resignFirstResponder()
    }
    
    @IBAction func getLit(_ sender: AnyObject) {
        totalMiles.text = inputMiles.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

