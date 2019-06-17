//
//  MyTableViewCell.swift
//  Class003
//
//  Created by L20102 on 2019/6/17.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"

    @IBOutlet weak var lbContent: UILabel!
    
    func updateContent(content:String) -> Void{
        self.lbContent.text = content
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
