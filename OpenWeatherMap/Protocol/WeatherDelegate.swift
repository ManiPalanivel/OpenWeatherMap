////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

protocol WeatherDelegate {
    func didUpdateWeatherReport(weatherReport : Weather)
}
