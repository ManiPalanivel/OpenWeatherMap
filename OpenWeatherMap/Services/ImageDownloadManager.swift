////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

final class ImageDownloadManager: WebServiceManager {
    
    override init() {
        super.init()
    }
    
     func downloadImage (urlString : String, completion :@escaping (Data) -> ()) {
        super.getData(urlString: urlString) { data in
            completion(data)
        }
    }
    
}

