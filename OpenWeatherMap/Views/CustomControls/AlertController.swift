////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

class AlertController : UIView{
    /**
     Shows alert on the provided ViewController.
     - Parameter inView: The UIViewController on which the alert has to be displayed
     - Parameter message: Message to be displayed on the alert
     - Parameter messageTitle: Title of the Alert
     - Parameter withActions: Array of actions embedded with the alert.
     */
    public static func showAlert(inView:UIViewController,withMessage: String, messageTitle:String, withActions: [UIAlertAction]?) {
        
        let presentingViewController = inView
        let alertController = UIAlertController(title: messageTitle, message: withMessage, preferredStyle: .alert)
        
        if let actions = withActions, !actions.isEmpty {
            for(_, anAlertAction) in actions.enumerated() {
                alertController.addAction(anAlertAction)
            }
        } else {
            alertController.addAction(getDefaultAlertAction())
        }
        
        presentingViewController.present(alertController, animated: true, completion: nil)
        
    }
    // Simple alert
    private static func getDefaultAlertAction()->UIAlertAction{
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        return defaultAction
    }
}
