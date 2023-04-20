//
//  NewListingViewController.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 30/03/2023.
//

import UIKit
import CoreData

class NewListingViewController: UIViewController {

    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var propertyType: SATextField_NewListing!
    @IBOutlet weak var buildingType: SATextField_NewListing!
    @IBOutlet weak var price: SATextField_NewListing!
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var rooms: SATextField_NewListing!
    @IBOutlet weak var address: SATextField_NewListing!
    @IBOutlet weak var included: SATextField_NewListing!
    
    //Variable that Store photo names
    var photoNames: [String] = []
    
    //Reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.borderColor = UIColor(red: 126/255, green: 147/255, blue: 249/255, alpha: 1.0).cgColor
        descriptionTextView.layer.cornerRadius    = 10
        descriptionTextView.clipsToBounds         = true
        
    
    }
    
    @IBAction func uploadPhoto(_ sender: SAButton_NewListing) {
        //Clear photo names in array
        photoNames = []
        
        //Create Alert
        let alert = UIAlertController(title: "Add Photo", message: "maximum 3 photo", preferredStyle: .alert)
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        //Configurating button handler of Alert
        let submitButton = UIAlertAction(title: "Add", style: .default){_ in
            //Get the Text Field for the alert
            let textField1 = alert.textFields![0]
            let textField2 = alert.textFields![1]
            let textField3 = alert.textFields![2]
            
            self.photoNames.append(textField1.text!)
            self.photoNames.append(textField2.text!)
            self.photoNames.append(textField3.text!)
        }
        
        //Add Button
        alert.addAction(submitButton)
        
        //Show Alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func createListing(_ sender: SAButton_NewListing) {
        //creating new listing
        let newListing = Listing(context: self.context)
        //take inputs
        newListing.propertyType = propertyType.text
        newListing.buildingType = buildingType.text
        newListing.price = price.text
        newListing.rooms = rooms.text
        newListing.address = address.text
        newListing.included = included.text
        newListing.propDescription = descriptionTextView.text
        newListing.photo1 = UIImage(named: photoNames[0])?.pngData()
        newListing.photo2 = UIImage(named: photoNames[1])?.pngData()
        newListing.photo3 = UIImage(named: photoNames[2])?.pngData()
        
        //Save data
        do{
            try self.context.save()
        }
        catch{
            //Handle some Errors
        }
        
    }
    
    
    
    @IBAction func sliderChangedValue(_ sender: UISlider) {
        var currentValue = sender.value
        price.text = "\(currentValue)"
    }
    

}
