//
//  SAButton_NewListing.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 19/04/2023.
//

import UIKit

class SAButton_NewListing: UIButton {

    //Regular initializer override
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    //For Storyboard button override
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpButton()
    }
    
    func setUpButton(){
        layer.backgroundColor = UIColor(red: 227/255, green: 111/255, blue: 91/255, alpha: 1.0).cgColor
        layer.cornerRadius    = frame.size.height/2
        clipsToBounds         = true
    }
    
    

}
