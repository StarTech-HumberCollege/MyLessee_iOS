//
//  MyListingTableViewCell.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 30/03/2023.
//

import UIKit

class MyListingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var numBeds: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var postDescription: UITextView!
    @IBOutlet weak var postedDaysAgo: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
