////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

struct ForeCast : Codable{
    let list : [ForeCastDay]
    let cod : String
}

struct ForeCastDay : Codable{
    let dt_txt : String
    let weather : [ForeCastDayWeather]
    let main : ForeCastMainDetail
}

struct ForeCastMainDetail : Codable{
    let temp_min : Double
    let temp_max : Double
}

struct ForeCastDayWeather : Codable {
    let icon : String
    let id : Int64
}
