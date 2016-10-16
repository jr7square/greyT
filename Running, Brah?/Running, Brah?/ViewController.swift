//
//  ViewController.swift
//  Running, Brah?
//
//  Created by Stacy Kam on 10/15/16.
//  Copyright © 2016 GreyT. All rights reserved.
//

import UIKit
import CoreMotion
import AVFoundation



class ViewController: UIViewController{

    var audioPlayer = AVAudioPlayer()


    @IBOutlet weak var inputMiles: UITextField!
    @IBOutlet weak var totalMiles: UILabel!
    @IBOutlet weak var motMes: UILabel!
    @IBOutlet weak var currentMiles: UILabel!
    
    let activityManager = CMMotionActivityManager()
    let pedometer = CMPedometer()
    
    @IBAction func hideKeyboard(_ sender: AnyObject) {
        inputMiles.resignFirstResponder()
    }
    
    
    @IBAction func getLit(_ sender: AnyObject) {
    
    
      totalMiles.text = inputMiles.text
      currentMiles.text = "0"
    let date = Date()
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.component(.minute, from: date)
    //print(components)
        
        pedometer.startUpdates(from: date) {
            (data, error) in
            guard (error == nil) else {
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("no data was retrieved")
                return
            }
            
            
            self.currentMiles.text = String(Int((data.distance)!))
            
            if(Int(data.distance!) >= Int(self.totalMiles.text!)!){
                self.pedometer.stopUpdates()
                self.audioPlayer.stop()
                print("Goal reach! Harambe is proud of you!")
            }
            
            
            
        }
        print("gjkkj")
        
      if(CMMotionActivityManager.isActivityAvailable())
        {
            self.activityManager.startActivityUpdates(to: OperationQueue.main)
            {
                (data) in
                DispatchQueue.main.async
                    {
                        if(data?.stationary == true){
                            var pathForResource = "soundeffect"
                            //build url with above info
                            let sourcePath = Bundle.main.path(forResource: pathForResource, ofType: "mp3")
                            let url = URL(fileURLWithPath: sourcePath!)
                            
                            //pass in to read into p
                            
                            do
                            {
                                self.audioPlayer = try! AVAudioPlayer(contentsOf: url)
                                self.audioPlayer.prepareToPlay()
                                self.audioPlayer.play()
                                try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                                try AVAudioSession.sharedInstance().setActive(true)
                            } catch
                            {
                                print("error to build url with contents")
                            }
                            
                            print(self.audioPlayer.volume)
                            print(self.audioPlayer.prepareToPlay())
                            
                        } else if (data?.walking == true){
                            print("Walking")
                            
                        } else if (data?.running == true){
                            self.audioPlayer.stop()
                            print("Running")
                            
                        }
                        else if (data?.automotive == true){
                            print("Automotive")
                        }
                        
                }
                
            }
        }

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


