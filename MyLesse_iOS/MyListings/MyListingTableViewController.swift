//
//  MyListingTableViewController.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 30/03/2023.
//

import UIKit
import CoreData

class MyListingTableViewController: UITableViewController {
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    //Appartments Array List
    var appartments: [Listing]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Read Core Data
        fetchListings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Read Core Data
        fetchListings()
    }
    
    func fetchListings(){
        do{
            //Try to assign all data that were fetched to appartments array
            self.appartments = try context.fetch(Listing.fetchRequest())
            //Reload Data in Table View
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch{
            //Some error handling
        }
        
        
    }
    
//    func initAppartmentsList(){
//        appartments = [
//            Listing(price: "207800", numBeds: "1", address: "Professor Damien Paul", imageName: "myListingHouse1", postDescription: "Luxurious and upgraded, this 4 bedroom, 4.5 bathroom home of 5,281 sq. ft. (including poolhouse, per independent third-party measurement) rests on a lot of 1.23 acres (per county) on a peaceful cul-de-sac in the Lakeside neighborhood. Richly-appointed spaces include large gathering areas, a bright, professional-grade kitchen, spectacular dining room, two walk-out master suites, and a home theater.", postedDaysAgo: "2 Weeks ago"),
//            Listing(price: "1435000", numBeds: "6", address: "Jake House 15, Toronto, Ontario", imageName: "myListingHouse2", postDescription: "Boasting an array of sleek finishes and a thoughtful open plan layout, this immaculate 1-bedroom, 1-bathroom condo is a paradigm of contemporary Brooklyn living. Features of this 531 sq. ft. home include wide plank engineered hardwood floors, huge Pella windows with western exposure, central heating and cooling, and a convenient washer/dryer hook-up. Beyond a functional entryway space the home flows into a luminous, open- concept living, dining, and kitchen area. The galley-style kitchen is equipped with white quartz countertops, a white tile backsplash, Nolte cabinets, and a suite of high-end stainless steel appliances from Samsung and Fisher & Paykel. ", postedDaysAgo: "15 days ago"),
//            Listing(price: "3200000", numBeds: "7", address: "Rosalean Avenue 17, Toronto, Ontario", imageName: "myListingHouse3", postDescription: "This 7 Bedroom W/ 2 Full Bathroom Ranch Home Is Immaculate & Full Of Upgrades! Enjoy The Open Floor Plan W/ Vaulted 15ft Ceilings & Large Windows Throughout. The Beautiful Kitchen Is The Heart Of The Home Complete With Large Customized Granite Island & Stainless Steel Appliances. Updated Lighting Throughout The Entire Home. Fully Updated Guest Bathroom And Laundry Room. This Floorplan Includes 2′ Extension On Every Side Increasing The Square Footage, Large Extended Patio For Entertaining Right Off The Dining Area. The Large Master Bedroom W/ Large Garden Tub, Double Sinks & Huge Walk-In Closet. Enjoy The Fully Fenced Backyard Perfect For Kids & Pets. The 2.5 Car Extended Garage Allows Room For Extra Storage Or Work Area.", postedDaysAgo: "4 hours ago")
//        ]
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appartments!.count
    }

    
    
    //------------------------------------------- SHOW DATA FOR EVERY CELL IN THE TABLE -------------------------------------------------------------
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListingCell", for: indexPath) as! MyListingTableViewCell

        let thisAppartment = appartments![indexPath.row]
        
        cell.price.text = thisAppartment.price
        cell.numBeds.text = thisAppartment.rooms
        cell.address.text = thisAppartment.address
        cell.picture.image = UIImage(data: thisAppartment.photo1!)
        cell.postDescription.text = thisAppartment.propDescription
//        cell.postedDaysAgo.text = thisAppartment.postedDaysAgo
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        216
    }
    
 //------------------------------------------- DELETE SPECIFIC LISTING -------------------------------------------------------------
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            //Get the Listing to Delete
            let removeListing = self.appartments![indexPath.row]
            
            //Remove from Core Data
            self.context.delete(removeListing)
            
            //Save Data
            do{
                try self.context.save()
            }
            catch{
                //Handle some errors
            }
            
            //Re-fetch the updated data and display in Table View
            self.fetchListings()
        }
        
        //return Swipe action
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    
    
 //------------------------------------------- PASS DATA TO PROPERTY DETAILS VIEW -------------------------------------------------------------
    
    //MARK: Access the func didSelectRowAt()
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = (storyboard?.instantiateViewController(identifier: "PropertyDetailsIdentifier")) as? PropertyDetailsViewController{
            
            let thisAppartment = appartments![indexPath.row]
            
            vc.priceTransfered = thisAppartment.price!
            vc.buildingTypeTransfered = thisAppartment.buildingType!
            vc.propertyTypeTransfered = thisAppartment.propertyType!
            vc.addressTransfered = thisAppartment.address!
            vc.numberRoomsTransfered = thisAppartment.rooms!
            vc.includesTransfered = thisAppartment.included!
            vc.propertyDescTransfered = thisAppartment.propDescription!
            vc.photo1 = UIImage(data: thisAppartment.photo1!)!
            vc.photo2 = UIImage(data: thisAppartment.photo2!)!
            vc.photo3 = UIImage(data: thisAppartment.photo3!)!
            
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }

//------------------------------------------- GO TO FORM FOR CREATING NEW LISTINGS -------------------------------------------------------------
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
