////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

struct QueryParam : Codable {
    let q : String
    let apikey : String = Constant.apiKey
}
