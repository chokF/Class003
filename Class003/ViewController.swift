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
        
        //print("\(UserDefaults.standard.string(forKey:"hi")!)")
        
        let worker : FileWorker = FileWorker()
        
        worker.writeToFile(content: "中文", fileName: "info.txt", tag: 0)
        
        let result : String = worker.readFromFile(fileName: "info.txt", tag: 0)
        
        print(result)
    }


}

