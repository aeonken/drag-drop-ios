//
//  Column+Drop.swift
//  Drag-Drop
//
//  Created by sirisha illa on 28/07/18.
//  Copyright © 2018 Aeonken. All rights reserved.
//

import Foundation
import UIKit

extension Column: UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
        
        let destinationIndexPath: IndexPath
        if let indexPath = coordinator.destinationIndexPath {
            destinationIndexPath = indexPath
        } else {
            // Get last index path of table view.
            let section = tableView.numberOfSections - 1
            let row = tableView.numberOfRows(inSection: section)
            destinationIndexPath = IndexPath(row: row, section: section)
        }
        
        // add respective coordinators for each data type you are supporting
        coordinator.session.loadObjects(ofClass: NSString.self) { items in
            let stringItems = items as! [String]
            addItems(stringItems)
        }
        
        func addItems(_ items: [String]){
            for (index, item) in items.enumerated() {
                let indexPath = IndexPath(row: destinationIndexPath.row + index, section: destinationIndexPath.section)
                if DragDrop_Session.indexes.count == 0 {
                    self.items.insert(item, at: indexPath.row)
                } else {
                    if !(self === DragDrop_Session.tableViews[index]) {
                        self.items.insert(item, at: indexPath.row)
                    } else {
                        let initialIndexPath = DragDrop_Session.indexes[index]
                        self.items.remove(at: initialIndexPath.row)
                        self.items.insert(item, at: indexPath.row)
                    }
                }
            }
            DragDrop_Session.removeAll()
            self.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self) || session.canLoadObjects(ofClass: UIImage.self)
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if DragDrop_Session.indexes.count == 0 {
            return UITableViewDropProposal(operation: .copy, intent: .automatic)
        }
        return UITableViewDropProposal(operation: .move, intent: .automatic)
        
    }
}
