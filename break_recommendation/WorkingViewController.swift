//
//  WorkingViewController.swift
//  break_recommendation
//
//  Created by 田中歩 on 2017/09/16.
//  Copyright © 2017年 田中歩. All rights reserved.
//

import UIKit
import CoreImage


class WorkingViewController: UIViewController {
    
    var tired_point = 0
    var eyeblink_rate = 0.0
    var faceTracker:FaceTracker? = nil;
    @IBOutlet var cameraView :UIView!//viewController上に一つviewを敷いてそれと繋いでおく
    @IBOutlet weak var number: UILabel!
    
    var rectView = UIView()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.rectView.layer.borderWidth = 3//四角い枠を用意しておく
        self.view.addSubview(self.rectView)
        faceTracker = FaceTracker(view: self.cameraView, findface:{arr in
            let rect = arr[0];//一番の顔だけ使う
            self.rectView.frame = rect;//四角い枠を顔の位置に移動する
            
        })
        Timer.scheduledTimer(timeInterval: 10.00, target: self, selector: #selector(self.onUpdate), userInfo: nil, repeats: true)
    }
    
    func onUpdate(){
        eyeblink_rate = Double(COUNT / REST_COUNT)
        if (eyeblink_rate <= 0.45){
            tired_point += 1
            number.text = String(tired_point)
        
        }
        else{
            
        }
        COUNT = 0
    }
    
    
    
}
