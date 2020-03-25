//
//  ViewController.swift
//  PointsOfInterestDemo
//
//  Created by Robert Ryan on 3/25/20.
//  Copyright © 2020 Robert Ryan. All rights reserved.
//

import UIKit
import os.log

private let pointsOfInterest = OSLog(subsystem: "PointsOfInterestDemo", category: .pointsOfInterest)

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        os_signpost(.event, log: pointsOfInterest, name: "viewDidLoad")
    }

    @IBAction func didTapStartRange(_ sender: Any) {
        let id = OSSignpostID(log: pointsOfInterest)
        os_signpost(.begin, log: pointsOfInterest, name: "didTapStartRange", signpostID: id)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            os_signpost(.end, log: pointsOfInterest, name: "didTapStartRange", signpostID: id)
        }

        os_log("didTapStartRange")
    }

    @IBAction func didTapSignpost(_ sender: Any) {
        os_signpost(.event, log: pointsOfInterest, name: #function)

        os_log("didTapSignpost")
    }
}

