//
//  ViewController.swift
//  break_recommendation
//
//  Created by 田中歩 on 2017/09/13.
//  Copyright © 2017年 田中歩. All rights reserved.
//

import UIKit
import CoreImage


class ViewController: UIViewController {

    var faceTracker:FaceTracker? = nil;
    @IBOutlet var cameraView :UIView!//viewController上に一つviewを敷いてそれと繋いでおく
    
    var rectView = UIView()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.rectView.layer.borderWidth = 3//四角い枠を用意しておく
        self.view.addSubview(self.rectView)
        faceTracker = FaceTracker(view: self.cameraView, findface:{arr in
            let rect = arr[0];//一番の顔だけ使う
            self.rectView.frame = rect;//四角い枠を顔の位置に移動する
        })
    }



}

