//
//  Drag-Drop-Session.swift
//  Drag-Drop
//
//  Created by sirisha illa on 28/07/18.
//  Copyright © 2018 Aeonken. All rights reserved.
//

import Foundation
import UIKit

class DragDrop_Session {
    
    public static var tableViews: [Column]! = []
    public static var indexes: [IndexPath]! = []
    
    public static func clear() {
        tableViews = [Column]()
        indexes = [IndexPath]()
    }
    
    public static func addSessionItem(from column: Column, at indexPath: IndexPath) {
        tableViews.append(column)
        indexes.append(indexPath)
    }
    
    public static func removeAll() {
        for c in 0..<tableViews.count {
            tableViews[c].items.remove(at: indexes[c].row)
            tableViews[c].reloadData()
        }
        clear()
    }
}
