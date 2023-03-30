//
//  Messages_TableViewCell.swift
//  MyLesse_iOS
//
//  Created by Alvaro Beltran on 2023-03-29.
//

import UIKit

class Messages_TableViewCell: UITableViewCell {

    @IBOutlet var message_name : UILabel!
    @IBOutlet var message_img : UIImageView!
    @IBOutlet var message_msg : UILabel!
    @IBOutlet var message_date : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
