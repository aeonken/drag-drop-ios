//
//  ItemCell.swift
//  Drag-Drop
//
//  Created by sirisha illa on 28/07/18.
//  Copyright © 2018 Aeonken. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {
    
    @IBOutlet var postLabel: UILabel!
    
    func awakeFromNib(label: String!) {
        super.awakeFromNib()
        self.postLabel.text = label
        self.backgroundColor = UIColor.clear
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
