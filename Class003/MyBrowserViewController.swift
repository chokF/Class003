//
//  MyBrowserViewController.swift
//  Class003
//
//  Created by L20102-02 on 2019/5/6.
//  Copyright © 2019年 L20102-02. All rights reserved.
//

import UIKit

class MyBrowserViewController: UIViewController {

    @IBOutlet weak var btnGoBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisAppear(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self,  name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self,  name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillAppear(notification:NSNotification?){
        print("keyboardWillAppear")
        
        guard let frame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else{
            return
        }
        
        self.btnGoBottomConstraint.constant = frame.cgRectValue.height;        
    }
    
    @objc func keyboardWillDisAppear(notification:NSNotification?){
        print("keyboardWillDisAppear")
        self.btnGoBottomConstraint.constant = 31;
    }

}
