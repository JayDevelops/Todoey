//
//  ViewController.swift
//  Todoey
//
//  Created by Jesus Perez on 7/27/18.
//  Copyright © 2018 Jesus Perez. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    //Stores key pair values in the launches of your own app
    let defaults = UserDefaults.standard
    
    var itemListArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Kiss Yari"
        itemListArray.append(newItem)
        
        
        //To save and call to the specific key id in order to retrieve new inputted to do lists, also wont crash
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item] {
            itemListArray = items
        }
        
    }
    
    
    //MARK- Table View Datasource Methods
    
    //Displays how many rows we want in the view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListArray.count
    }
    
    //Displays what will be displayed on the table cell, the text
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //set a variable known as a cell to the cell in the story board with identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let itemRow = itemListArray[indexPath.row]
        
        //set the text label to the item list array and the current row path
        cell.textLabel?.text = itemRow.title
        
        //checks if the cell indeed has a done then put a checkmark, else a none
        cell.accessoryType = itemRow.done ? .checkmark : .none
        
        return cell
    }

    
    
    //MARK- Table View Delegate Methods
    
    //Everytime you click on a cell, it prints to the console and highlights it gray
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemListArray[indexPath.row])
        
        //Takes the opposite of what it currently is
        itemListArray[indexPath.row].done = !itemListArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    //MARK- Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        //New UI Alert controller
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        //The button you will press when done writing your to do list item
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            //Add the input data to the cell array
            self.itemListArray.append(newItem)
            
            //Add the user input data to the default storage, with the pList, saves the data to the key
            self.defaults.set(self.itemListArray, forKey: "ToDoListArray")
            
            //Reloads the data for the user inputted data
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        //Add an alert text field
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        //Show the UI Alert Controller when the user presses the button
        present(alert, animated: true, completion: nil)
    }
    
    
    
}

