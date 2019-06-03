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
    
    
    @IBAction func btnMapClicked(_ sender: UIButton) {
         self.performSegue(withIdentifier: "moveToMapSegue", sender: self)
        
    }
    
    @IBAction func btnMoveToImageClicked(_ sender: Any) {
        let alert = UIAlertController(title: "資訊", message: "YN", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "YES", style: .default, handler: { action in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "moveToM2KSegue", sender: self)
            }
        })
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "NO", style: .default, handler: { action in
            
        })
        
         alert.addAction(cancelAction)
        
        present(alert,animated:true,completion:nil)
        //performSegue(withIdentifier: "moveToM2KSegue", sender: self)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToM2KSegue"){
            let vc = segue.destination as! ImageViewController
            vc.index = 5
        }
    }


}

