//
//  ViewController.swift
//  Running, Brah?
//
//  Created by Stacy Kam on 10/15/16.
//  Copyright © 2016 GreyT. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    @IBOutlet weak var inputMiles: UITextField!
    @IBOutlet weak var totalMiles: UILabel!
    @IBOutlet weak var motMes: UILabel!
    @IBOutlet weak var currentMiles: UILabel!

    @IBAction func getLit(_ sender: AnyObject) {
        totalMiles.text = inputMiles.text
    }
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
        inputMiles.resignFirstResponder()
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

