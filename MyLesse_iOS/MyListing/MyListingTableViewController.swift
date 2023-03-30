//
//  MyListingTableViewController.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 30/03/2023.
//

import UIKit

class MyListingTableViewController: UITableViewController {

    //Appartments Array List
    var appartments = [Appartment]()
    // Structure for Course
    struct Appartment {
        let price: String
        let numBeds: String
        let address: String
        let imageName: String
        let postDescription: String
        let postedDaysAgo: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Listing"
        
        initAppartmentsList()
    }
    
    func initAppartmentsList(){
        appartments = [
            Appartment(price: "207800", numBeds: "1", address: "Professor Damien Paul", imageName: "myListingHouse1", postDescription: "Luxurious and upgraded, this 4 bedroom, 4.5 bathroom home of 5,281 sq. ft. (including poolhouse, per independent third-party measurement) rests on a lot of 1.23 acres (per county) on a peaceful cul-de-sac in the Lakeside neighborhood. Richly-appointed spaces include large gathering areas, a bright, professional-grade kitchen, spectacular dining room, two walk-out master suites, and a home theater.", postedDaysAgo: "2 Weeks ago"),
            Appartment(price: "1435000", numBeds: "6", address: "Jake House 15, Toronto, Ontario", imageName: "myListingHouse2", postDescription: "Boasting an array of sleek finishes and a thoughtful open plan layout, this immaculate 1-bedroom, 1-bathroom condo is a paradigm of contemporary Brooklyn living. Features of this 531 sq. ft. home include wide plank engineered hardwood floors, huge Pella windows with western exposure, central heating and cooling, and a convenient washer/dryer hook-up. Beyond a functional entryway space the home flows into a luminous, open- concept living, dining, and kitchen area. The galley-style kitchen is equipped with white quartz countertops, a white tile backsplash, Nolte cabinets, and a suite of high-end stainless steel appliances from Samsung and Fisher & Paykel. ", postedDaysAgo: "15 days ago"),
            Appartment(price: "3200000", numBeds: "7", address: "Rosalean Avenue 17, Toronto, Ontario", imageName: "myListingHouse3", postDescription: "This 7 Bedroom W/ 2 Full Bathroom Ranch Home Is Immaculate & Full Of Upgrades! Enjoy The Open Floor Plan W/ Vaulted 15ft Ceilings & Large Windows Throughout. The Beautiful Kitchen Is The Heart Of The Home Complete With Large Customized Granite Island & Stainless Steel Appliances. Updated Lighting Throughout The Entire Home. Fully Updated Guest Bathroom And Laundry Room. This Floorplan Includes 2′ Extension On Every Side Increasing The Square Footage, Large Extended Patio For Entertaining Right Off The Dining Area. The Large Master Bedroom W/ Large Garden Tub, Double Sinks & Huge Walk-In Closet. Enjoy The Fully Fenced Backyard Perfect For Kids & Pets. The 2.5 Car Extended Garage Allows Room For Extra Storage Or Work Area.", postedDaysAgo: "4 hours ago")
        ]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appartments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListingCell", for: indexPath) as! MyListingTableViewCell

        let thisAppartment = appartments[indexPath.row]
        
        cell.price.text = thisAppartment.price
        cell.numBeds.text = thisAppartment.numBeds
        cell.address.text = thisAppartment.address
        cell.picture.image = UIImage(named: thisAppartment.imageName)
        cell.postDescription.text = thisAppartment.postDescription
        cell.postedDaysAgo.text = thisAppartment.postedDaysAgo

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        216
    }
    
    
    @IBAction func addNewListing(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToNewListing", sender: self)
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
