////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

struct ForecastControllerViewModel {
    private var queryParam : String
    private var forecastServiceManager : ForecastServiceManager
    private var forecastDelegate : ForeCastDelegate
    
    init(queryParam : String, forecastServiceManager : ForecastServiceManager, forecastDelegate: ForeCastDelegate) {
        self.queryParam = queryParam
        self.forecastServiceManager = forecastServiceManager
        self.forecastDelegate = forecastDelegate
        getforecastReport()
    }
    
    func getforecastReport(){
        let queryParameter = QueryParam.init(q: self.queryParam)
        self.forecastServiceManager.getForeCastReport(source: queryParameter){
            forecast in
            self.forecastDelegate.didUpdateForecastReport(forecastReport: forecast)
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(forecast) {
                StorageServiceManager.shared.storeData(data: encoded, key: Constant.identifiers.forecastKey)
            }
        }
    }
}
