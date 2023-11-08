//
//  TableViewController.swift
//  CoreDataTest
//
//  Created by Андрей on 08.11.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var tasks: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Task", message: "Please, add new task", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            let tf = alertController.textFields?.first
            if let newTask = tf?.text, tf?.text != "" {
                self.tasks.insert(newTask, at: 0)
                self.tableView.reloadData()
            }
        }
        
        alertController.addTextField()
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}
