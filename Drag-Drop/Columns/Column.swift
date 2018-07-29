//
//  Column.swift
//  Drag-Drop
//
//  Created by sirisha illa on 28/07/18.
//  Copyright © 2018 Aeonken. All rights reserved.
//

import UIKit

class Column: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var title: String!
    var color: UIColor!
    var headerHeight: CGFloat = 60
    
    /* change to any, to support different types of draggable items
    like images and others */
    var items: [String]!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
        self.dataSource = self
        self.dragDelegate = self
        self.dropDelegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if let table = tableView as? Column {
            let item: Any = table.items[indexPath.row]
            
            // if supporting different items, add appropritate if conditions to pick appropriate cell and item type.
            if (item as AnyObject).isKind(of: NSString.self) {
                cell = tableView.dequeueReusableCell(withIdentifier: "label", for: indexPath) as! LabelCell
                (cell as! LabelCell).awakeFromNib(label: (item as! String))
            }
            
            cell.tag = indexPath.row
        } else {
            print("Unknown UITableView format.")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //Adding header
        let cgRect = CGRect(x: 0, y: 0, width: tableView.frame.width, height: headerHeight)
        let headerView: UIView = UIView(frame: cgRect)
        headerView.backgroundColor =  self.color
        
        let label = UILabel(frame: headerView.frame)
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.text = self.title
        label.font = UIFont(name: "Helvetica", size: 24)
        headerView.addSubview(label)
        
        return headerView
    }
    
    
    
}
