////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

class WebServiceManager: NSObject {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    override init() {
        super.init()
    }
    
    func getData (urlString : String, completion :@escaping (Data) -> ()) {
        
        self.dataTask?.cancel()
        ProgressIndicator.sharedInstance.showIndicator()
        let reportURL = URL(string: urlString)!
        if(ReachabilityManager.shared.isReachable()){
            DispatchQueue.global().async {
                self.dataTask = self.defaultSession.dataTask(with: reportURL) { [weak self] data, response, error in
                    defer {
                        self?.dataTask = nil
                        ProgressIndicator.sharedInstance.hideIndicator()
                    }
                    if let responseData = data {
                        completion(responseData)
                    }
                }
                self.dataTask?.resume()
            }
        }
    }
}
