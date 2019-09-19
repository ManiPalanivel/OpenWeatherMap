////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

class StorageServiceManager {
    
    static let shared = StorageServiceManager()
    let defaults = UserDefaults.standard

    private init(){
        
    }
    
    func storeData(data : Data, key : String){
        defaults.set(data, forKey: key)
    }
    
    func retrieveData(key : String) -> Data?{
        if let savedData = defaults.object(forKey: key) as? Data {
            return savedData
        }
        return nil
    }
    
}
