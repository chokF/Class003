//
//  ViewController.swift
//  Class003
//
//  Created by L20102-02 on 2019/4/22.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbMessage: UILabel!
    
    @IBAction func btnPushClicked(_ sender: UIButton) {
        lbMessage.text = "Hi, Xcode"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

