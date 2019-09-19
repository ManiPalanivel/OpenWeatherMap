////  OpenWeatherMap
//
//  Created by Mani on 18/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

extension UIViewController{
    func setBackgroundImage(imageNamed : String){
        let scaledImage = UIImage.scaleImage(image:UIImage.init(imageLiteralResourceName: imageNamed), scaledToSize: self.view.bounds.size)
        self.view.backgroundColor = UIColor.init(patternImage: scaledImage);
    }
    
    func setpreferredStatusBarStyle(statusBarStyle : UIStatusBarStyle){
        if let statusBar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusBar.setValue(statusBarStyle == .lightContent ? UIColor.white : .black, forKey: "foregroundColor")
        }
    }
    
    func endEditing(){
        let tapGesture = UITapGestureRecognizer.init(target: self.view, action: #selector(UIView.endEditing(_:)))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


