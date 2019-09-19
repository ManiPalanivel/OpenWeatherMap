////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

final class WeatherServiceManager: WebServiceManager {
    
    override init() {
        super.init()
    }
    
    func getWeatherReport (source : QueryParam, completion :@escaping (Weather) -> ()) {
        let urlString = QueryParamGenerator.generateURL(queryParam: source.dictionary ?? [:], path: Constant.weatherReport)
        super.getData(urlString: urlString) { data in
            do {
                let weatherReport = try JSONDecoder().decode(Weather.self, from: data)
                completion(weatherReport)
            } catch {
                print(error) // any decoding error will be printed here!
            }
        }
        
        
    }
}
