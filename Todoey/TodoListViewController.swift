//
//  ViewController.swift
//  Todoey
//
//  Created by Jesus Perez on 7/27/18.
//  Copyright © 2018 Jesus Perez. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemListArray = ["Find Yari", "Hug Yari", "Kiss Yari"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        //set the text label to the item list array and the current row path
        cell.textLabel?.text = itemListArray[indexPath.row]
        
        return cell
    }

    
    
    //MARK- Table View Delegate Methods
    
    //Everytime you click on a cell, it prints to the console and highlights it gray
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemListArray[indexPath.row])
        
        //Gets the current indexPath and puts a checkmark when the user click on it
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }   else    {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
    //MARK- Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        //New UI Alert controller
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        //The button you will press when done writing your to do list item
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What happend once the user clicks on the button
            print("Sucess, this button was pressed!")
            print(textField.text!)
            
            self.itemListArray.append(textField.text!)
            
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

