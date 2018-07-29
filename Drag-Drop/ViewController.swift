//
//  ViewController.swift
//  Drag-Drop
//
//  Created by sirisha illa on 28/07/18.
//  Copyright © 2018 Aeonken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todo: Column!
    @IBOutlet weak var inprogress: Column!
    @IBOutlet weak var done: Column!
    
    var todo_data_source: [String] = ["Buy Groceries", "Buy Cake", "Flowers", "Buy Champagne"]
    var inprogress_data_source: [String] = ["Go to Shopping"]
    var done_data_source: [String] = ["Fill Gas in car."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.todo.items =  todo_data_source
        self.todo.title = "TODO"
        self.todo.color = UIColor.red
        
        self.inprogress.items = inprogress_data_source
        self.inprogress.title = "In Progress"
        self.inprogress.color = UIColor.green
        
        self.done.items = done_data_source
        self.done.title = "Done"
        self.done.color = UIColor.blue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

