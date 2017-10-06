//
//  ViewController.swift
//  break_recommendation
//
//  Created by 田中歩 on 2017/09/13.
//  Copyright © 2017年 田中歩. All rights reserved.
//

import UIKit
import CoreImage
import Firebase

var databaseRef:DatabaseReference!
let deviceId = UIDevice.current.identifierForVendor!.uuidString
let formatter = DateFormatter()
var date = Date()
var dateStr = formatter.string(from: date)




class ViewController: UIViewController {
   
    @IBOutlet weak var number: UILabel!
    
    @IBOutlet weak var tired: UIButton!
    
    
    var faceTracker:FaceTracker? = nil;
    @IBOutlet var cameraView :UIView!//viewController上に一つviewを敷いてそれと繋いでおく
    
    var rectView = UIView()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        databaseRef = Database.database().reference()
        self.rectView.layer.borderWidth = 3//四角い枠を用意しておく
        self.view.addSubview(self.rectView)
        faceTracker = FaceTracker(view: self.cameraView, findface:{arr in
            let rect = arr[0];//一番の顔だけ使う
            self.rectView.frame = rect;//四角い枠を顔の位置に移動する
        
        })
    //Timer.scheduledTimer(timeInterval: 10.00, target: self, selector: #selector(self.onUpdate), userInfo: nil, repeats: false)
        
        
        
    }
    
    func onUpdate(){
        
        REST_COUNT = COUNT / 3
        number.text = (String(REST_COUNT))
        
        
    
    }

    
    @IBAction func tired(_ sender: Any) {
        formatter.dateFormat = "MM-dd-HH-mm-ss"
        let callTired:[String:Any] = ["time":dateStr,"tired": TIRED];
        TIRED = 1
        databaseRef.childByAutoId().child(deviceId).setValue(callTired)
        
        
    }


}

