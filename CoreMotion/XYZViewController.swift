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
    @IBOutlet weak var square: UIView!
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
            
            self.moveSquare(x: CGFloat(accelerometerData.acceleration.x), y: CGFloat(accelerometerData.acceleration.y))
        }
        // Do any additional setup after loading the view.
    }
    
    func moveSquare(x: CGFloat, y:CGFloat) {
        let xPosition = square.frame.origin.x
        let yPosition = square.frame.origin.y
        
        let width = square.frame.size.width
        let height = square.frame.size.height
        
        // Get the device frame size
        let screen = UIScreen.main.bounds
        let screenWidth = screen.width
        let screenHeight = screen.height
        
        UIView.animate(withDuration: 0) {
            guard (xPosition + x >= 0 && xPosition + width + x <= screenWidth) && (yPosition - y >= 0 && yPosition + height - y <= screenHeight) else { return }
            self.square.frame = CGRect(x: xPosition + x, y: yPosition - y, width: width, height: height)
        }
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
