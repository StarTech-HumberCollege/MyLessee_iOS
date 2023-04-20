//
//  SATextField_NewListing.swift
//  MyLesse_iOS
//
//  Created by Liza Zhyr on 30/03/2023.
//

import UIKit

class SATextField_NewListing: UITextField {
    
    //Regular initializer override
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    //For Storyboard button override
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpField()
    }
    
    
    private func setUpField() {
        setShadow()
        layer.borderWidth = 1.0
        layer.borderColor = UIColor(red: 126/255, green: 147/255, blue: 249/255, alpha: 1.0).cgColor
        layer.cornerRadius    = frame.size.height/2
        clipsToBounds         = true
        
        //Placeholder margins --> enter empty box before the placeholder
        leftView              = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftViewMode          = .always
        
    }
    
    private func setShadow() {
            layer.shadowColor   = UIColor.red.cgColor
            layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
            layer.shadowRadius  = 8
            layer.shadowOpacity = 0.9
            clipsToBounds       = true
            layer.masksToBounds = false
        }
    
}
