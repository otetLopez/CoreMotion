//
//  XYZViewController.swift
//  CoreMotionDemo
//
//  Created by otet_tud on 1/21/20.
//  Copyright © 2020 otet_tud. All rights reserved.
//

import UIKit
import CoreMotion

class XYZViewController: UIViewController {

 
    @IBOutlet weak var xlbl: UILabel!
    @IBOutlet weak var ylbl: UILabel!
    @IBOutlet weak var zlbl: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let accelerometerData = data else { return }
            // print(accelerometerData)
            
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 1
            formatter.maximumFractionDigits = 2
            
            let x = formatter.string(for: accelerometerData.acceleration.x)!
            let y = formatter.string(for: accelerometerData.acceleration.y)!
            let z = formatter.string(for: accelerometerData.acceleration.z)!
            print(x, y, z)
            
            self.xlbl.text = "X: \(x)"
            self.ylbl.text = "Y: \(y)"
            self.zlbl.text = "Z: \(z)"
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
