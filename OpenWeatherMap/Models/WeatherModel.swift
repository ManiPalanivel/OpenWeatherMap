////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation


struct Weather : Codable {
    let weather : [WeatherDetail]
    let main : MainDetail
    let name : String
    let id : Int64
    let cod : Int
}

struct WeatherDetail : Codable{
    let id : Int64
    let main : String
    let description : String
    let icon : String
}

struct MainDetail : Codable{
    let temp : Double
    let temp_min : Double
    let temp_max : Double
}
