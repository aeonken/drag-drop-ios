//
//  Column+Drag.swift
//  Drag-Drop
//
//  Created by sirisha illa on 28/07/18.
//  Copyright © 2018 Aeonken. All rights reserved.
//

import UIKit

extension Column: UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = self.dragItem(indexPath: indexPath)
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, itemsForAddingTo session: UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem] {
        let dragItem = self.dragItem(indexPath: indexPath)
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, dragSessionDidEnd session: UIDragSession) {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (timer) in
            DragDrop_Session.clear()
        }
    }
    
    func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters? {
        let previewParams = UIDragPreviewParameters()
        previewParams.backgroundColor = UIColor.clear
        return previewParams
    }
    
    private func dragItem(indexPath: IndexPath) -> UIDragItem {
        DragDrop_Session.addSessionItem(from: self, at: indexPath)
        
        var dragItemProvider: NSItemProvider!
        //based on the draggable item types, cast it to appropriate type to identify the
        //right cell to be used and right type to be passed in the drag session
        if let cell = self.cellForRow(at: indexPath) as? LabelCell {
            dragItemProvider = NSItemProvider(object: cell.postLabel.text! as NSItemProviderWriting)
        }
        
        let draggedItem = UIDragItem(itemProvider: dragItemProvider)
        return draggedItem
    }
}
