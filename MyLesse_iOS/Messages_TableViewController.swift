//
//  Messages_TableViewController.swift
//  MyLesse_iOS
//
//  Created by Alvaro Beltran on 2023-03-29.
//

import UIKit

class Messages_TableViewController: UITableViewController {
   
    //Data for TableViews
    let data : [(name: String, message: String, date : String, img : String, premium : Bool)] = [("Tuyi Chen", "Hi Alvaro! I was referred to you by Anton, he told me you’re looking to rent your ...", "20/03/2023", "message_photo_0", false),("Anton Vinokurov", "Hey man, i have someone interested in your apartment, she will contact you","20/03/2023","message_photo_1", true),("Anton Vinokurov", "Hey man, i have someone interested in your apartment, she will contact you","20/03/2023","message_photo_1",false),("Anton Vinokurov", "Hey man, i have someone interested in your apartment, she will contact you","20/03/2023","message_photo_1",false),("Anton Vinokurov", "Hey man, i have someone interested in your apartment, she will contact you","20/03/2023","message_photo_1",false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
     
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        //************************** Configure tableview **************************
        tableView.rowHeight = 100
        
        //************************** Configure table view cell **************************
        let cell = tableView.dequeueReusableCell(withIdentifier: "Messages_TableViewCell", for: indexPath) as! Messages_TableViewCell
        
        cell.message_img.image = UIImage(named: data[indexPath.item].img)
        cell.message_name.text = data[indexPath.item].name
        cell.message_msg.text = data[indexPath.item].message
        cell.message_date.text = data[indexPath.item].date
        if(data[indexPath.item].premium) {
            cell.message_premium.image = UIImage(named:"ic_outline-verified-user" )
        }else {
            cell.message_premium.image = UIImage(named: "")
        }
        

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
