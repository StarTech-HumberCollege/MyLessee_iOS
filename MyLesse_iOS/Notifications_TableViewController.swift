//
//  Notifications_TableViewController.swift
//  MyLesse_iOS
//
//  Created by Alvaro Beltran on 2023-03-30.
//

import UIKit

class Notifications_TableViewController: UITableViewController {

    //Data for TableViews
    let data : [( action: String, notification : String, img : String)] = [( "Alvaro invited you to", "MyLessee Connect", "message_photo_0"),("Anton liked your","Comment published on March 21","message_photo_1"),("Anton liked your","Comment published on March 21","message_photo_1"),("Anton liked your","Comment published on March 21","message_photo_1"),("Anton liked your","Comment published on March 21","message_photo_1")]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(Notifications_TableViewCell.self, forCellReuseIdentifier: "Notifications_TableViewCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //************************** Configure tableview **************************
        tableView.rowHeight = 100
        let cell = tableView.dequeueReusableCell(withIdentifier: "Notifications_TableViewCell", for: indexPath) as! Notifications_TableViewCell
        cell.textLabel?.text = " HOLA"
        cell.notification_img.image = UIImage(named: data[indexPath.item].img)
        cell.notification_action.text = data[indexPath.item].action
        cell.notification_notification.text = data[indexPath.item].notification
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
