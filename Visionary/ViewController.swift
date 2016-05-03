//
//  ViewController.swift
//  Visionary
//
//  Created by Kilian Költzsch on 03/05/16.
//  Copyright © 2016 Kilian Koeltzsch. All rights reserved.
//

import UIKit
import Sodium

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sodium = Sodium()!
        let password = "Correct Horse Battery Staple".dataUsingEncoding(NSUTF8StringEncoding)!
        let hashedStr = sodium.pwHash.scrypt.str(password, opsLimit: sodium.pwHash.scrypt.OpsLimitInteractive, memLimit: sodium.pwHash.scrypt.MemLimitInteractive)!

        if sodium.pwHash.scrypt.strVerify(hashedStr, passwd: password) {
            print("PW matches")
        } else {
            print("PW doesn't match")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

