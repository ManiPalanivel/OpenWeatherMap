////  OpenWeatherMap
//
//  Created by Mani on 18/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

@IBDesignable class CustomUITextField : UITextField{
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
    }
    
    @IBInspectable var placeHolderColor: UIColor = UIColor.gray {
        didSet {
            self.textColor = placeHolderColor
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: placeHolderColor])
        }
    }
    
    @IBInspectable var bottomBorderRequired : Bool = false{
        didSet {
            if(bottomBorderRequired){
                let bottomBorder = UILabel.init()
                bottomBorder.frame = CGRect.init(x: self.bounds.origin.x, y: self.frame.size.height, width: self.bounds.size.width-self.frame.origin.x, height: 1.0)
                bottomBorder.backgroundColor = self.placeHolderColor
                self.addSubview(bottomBorder)
            }
        }
    }
}

extension CustomUITextField : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
