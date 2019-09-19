////  OpenWeatherMap
//
//  Created by Mani on 18/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation
import SVProgressHUD

/// Activity indicator to show when there are time consuming task
class ProgressIndicator {
    
    static let sharedInstance = ProgressIndicator()
    private init(){
        configureIndicator()}
    
    /** Configures the style of the indicator.You can set color of the indicator, ring radius, ring thickness, Mask style, etc. */
    private func configureIndicator(){
       // SVProgressHUD.setForegroundColor(UIColor.grtTheme())
        SVProgressHUD.setRingThickness(3.0)
        SVProgressHUD.setDefaultMaskType(.clear)
    }
    
    /** Use this method to  show the activity indicator from  UIViewContollers/UIView */
    public func showIndicator(){
        SVProgressHUD.show()
    }
    
    /** Use this method to  hide the activity indicator from  UIViewContollers/UIView */
    public func hideIndicator(){
        SVProgressHUD.dismiss()
    }
    
    /** Function to find the visibility of progress indicator.
     - returns : A boolean for visibility of indicator */
    public func isVisible()->Bool{
        return SVProgressHUD.isVisible()
    }
}

