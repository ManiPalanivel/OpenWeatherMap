////  OpenWeatherMap
//
//  Created by Mani on 18/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation
import Reachability

final class ReachabilityManager: NSObject {
    
    static let shared = ReachabilityManager()
    let reachability = Reachability()!
    
    private override init() {
        super.init()
    }
    
    
    //Checks for connection and returs the boolean
    // Ret
    func isReachable() -> Bool {
        if reachability.connection == .none{
            return false
        }
        else{
            return true
        }
    }
    
    // Called when needed as Notification for network reachability change
    // — parameter notification: Notification with the Reachability instance
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .wifi:
            print("Reachable via WiFi")
        case .cellular:
            print("Reachable via Cellular")
        case .none:
            print("Network not reachable")
        }
    }
    
    
    /// Starts monitoring the network availability status
    func startMonitoring() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            debugPrint("Could not start reachability notifier")
        }
    }
    
    /// Stops monitoring the network availability status
    func stopMonitoring(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
    }
}
