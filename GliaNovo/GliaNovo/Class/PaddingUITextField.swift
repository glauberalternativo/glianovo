//
//  PaddingUITextField.swift
//  GliaNovo
//
//  Created by Glauber Moreira on 04/06/20.
//  Copyright © 2020 Glauber Moreira. All rights reserved.
//

import UIKit

class PaddingUITextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
               
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
            
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15))
                
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
