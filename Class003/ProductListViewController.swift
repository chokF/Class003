//
//  ProductListViewController.swift
//  Class003
//
//  Created by L20102 on 2019/6/17.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier) as! MyTableViewCell
        
        let title : String = array[indexPath.row]
     
        cell.updateContent(content: title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        selectedContent = array [indexPath.row]
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToDetailSegue", sender: self)
        }
       
    }
    
    var selectedContent : String?
    
    var array : [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        array=["a","4日法務部到長榮大學舉辦成年年齡對話座談會，主要收集年輕人的聲音，讓政府可以對目前成年年齡的問題進行參考。現場先就就「法律責任」進行討論，以目前規定上，不同的年紀有不同的法律責任，如結婚年齡、刑事責任、行政責任、各類參政權等，並分析目前的年齡修正的看法，期望讓學生有多面向思考，最後進行討論與不具名問卷填寫調查。","c"]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToDetailSegue"){
            let destination = segue.destination as! DetailViewController
            destination.content = self.selectedContent
           
        }
    }

}
