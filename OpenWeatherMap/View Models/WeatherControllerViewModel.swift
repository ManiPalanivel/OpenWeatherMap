////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

struct WeatherControllerViewModel {
    private var queryParam : String
    private var weatherServiceManager : WeatherServiceManager
    public var weatherReport : Weather!
    private var weatherDelegate : WeatherDelegate
    
    init(queryParam : String, weatherServiceManager : WeatherServiceManager, weatherDelegate: WeatherDelegate) {
        self.queryParam = queryParam
        self.weatherServiceManager = weatherServiceManager
        self.weatherDelegate = weatherDelegate
        getWeatherReport()
    }
    
    func getWeatherReport(){
        let queryParameter = QueryParam.init(q: self.queryParam)
        self.weatherServiceManager.getWeatherReport(source: queryParameter){
              weather in
            self.weatherDelegate.didUpdateWeatherReport(weatherReport: weather)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(weather) {
                StorageServiceManager.shared.storeData(data: encoded, key: Constant.identifiers.weatherKey)
            }
        }
    }
}
