////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

extension URLComponents {
    
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
