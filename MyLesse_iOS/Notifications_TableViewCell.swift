//
//  Notifications_TableViewCell.swift
//  MyLesse_iOS
//
//  Created by Alvaro Beltran on 2023-03-30.
//

import UIKit

class Notifications_TableViewCell: UITableViewCell {

    @IBOutlet var notification_img : UIImageView!
    @IBOutlet var notification_action: UILabel!
    @IBOutlet var notification_notification: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
