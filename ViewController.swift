//
//  ViewController.swift
//  ShakeAppDemo
//
//  Created by Thomas Hinrichs on 24/04/2020.
//  Copyright © 2020 Thomas Hinrichs. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

   // @IBOutlet weak var label: UILabel!
    
    var motionManager = CMMotionManager()
    var queue = OperationQueue()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        statusLabel.isHidden = true
    }
    
   /* override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            label.text = "Device shaked."
        }
    }*/

    @IBAction func goToPaymentPressed(_ sender: UIButton) {
        motionManager.startDeviceMotionUpdates(to: queue) { (motion, error) in
            DispatchQueue.main.async {
                self.slider.value = Float((motion?.attitude.roll ?? 0) * 1.4)
                
                if self.slider.value == 1.0 {
                    self.statusLabel.isHidden = false
                    self.motionManager.stopDeviceMotionUpdates()
                    self.slider.isHidden = true
                }
            }
            
        }
        
    }
    
}

