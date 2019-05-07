//
//  ViewController.swift
//  Todoey
//
//  Created by Aldrin A Thivyanathan on 07/05/19.
//  Copyright © 2019 Aldrin A Thivyanathan. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
  
  var itemArray = [Item]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let newItem1 = Item()
    newItem1.title = "Item1"
    itemArray.append(newItem1)
    
    let newItem2 = Item()
    newItem2.title = "Item2"
    itemArray.append(newItem2)
    
    let newItem3 = Item()
    newItem3.title = "Item3"
    itemArray.append(newItem3)
  }
  
  //MARK - TableView DataSource Methods
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return itemArray.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
    let item = itemArray[indexPath.row]
    
    cell.textLabel?.text = item.title
    
    cell.accessoryType  = item.done ? .checkmark : .none
    
    return cell
  }
  
  //MARK - TableView Delegate Methods
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
    tableView.reloadData()
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  //MARK - Add New ToDo Items
  
  @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
      
      let newItem = Item()
      newItem.title = textField.text!
      self.itemArray.append(newItem)
      self.tableView.reloadData()
    }
    
    alert.addTextField { (alertTextFiled) in
      alertTextFiled.placeholder = "Create new item"
      textField = alertTextFiled
    }
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    
  }
  

}

