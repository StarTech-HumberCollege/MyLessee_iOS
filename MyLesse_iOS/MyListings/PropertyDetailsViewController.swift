//
//  PropertyDetailsViewController.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 19/04/2023.
//

import UIKit

class PropertyDetailsViewController: UIViewController {
    
    //Array of photo
    var photoArray = [UIImage]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var propertyType: UILabel!
    @IBOutlet weak var buildingType: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var numberRooms: UILabel!
    @IBOutlet weak var includes: UITextView!
    @IBOutlet weak var propertyDesc: UITextView!
    
    //Variables to get data from different screen
    var priceTransfered = ""
    var propertyTypeTransfered = ""
    var buildingTypeTransfered = ""
    var addressTransfered = ""
    var numberRoomsTransfered = ""
    var includesTransfered = ""
    var propertyDescTransfered = ""
    var photo1 = UIImage()
    var photo2 = UIImage()
    var photo3 = UIImage()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set Transfered data to View Controller Elements
        price.text = priceTransfered
        propertyType.text = propertyTypeTransfered
        buildingType.text = buildingTypeTransfered
        address.text = addressTransfered
        numberRooms.text = numberRoomsTransfered
        includes.text = includesTransfered
        propertyDesc.text = propertyDescTransfered
        
        //Transfer images to Collection Array
        photoArray.append(photo1)
        photoArray.append(photo2)
        photoArray.append(photo3)
        
    }

}

extension PropertyDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Use guard in order not to crash application when cell is not availiable
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? PropertyDetailsCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        cell.img.image = photoArray[indexPath.row]
        
        
        return cell
    }
    
    
}
