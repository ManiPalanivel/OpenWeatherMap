////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

final class ForecastServiceManager: WebServiceManager {
    
    override init() {
        super.init()
    }
    
    func getForeCastReport (source : QueryParam, completion :@escaping (ForeCast) -> ()) {
        let urlString = QueryParamGenerator.generateURL(queryParam: source.dictionary ?? [:], path: Constant.forecastingReportURL)
        super.getData(urlString: urlString) { data in
            do {
                let forecastReport = try JSONDecoder().decode(ForeCast.self, from: data)
                completion(forecastReport)
            } catch {
                print(error) // any decoding error will be printed here!
            }
        }
    }
    
}
