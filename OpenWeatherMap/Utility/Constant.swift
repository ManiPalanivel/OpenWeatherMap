////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

struct Constant{
    static let urlScheme = "https"
    static let baseURL = "api.openweathermap.org"
    static let commonPath = "/data/2.5"
    static let weatherReport = "/weather"
    static let forecastingReportURL = "/forecast"
    static let imageDownloadPath = "/img/w/"
    
    static let apiKey = "987f96bb523069449f13f3bd5b966632"
    
    struct identifiers {
        static let showReportViewControllerSegueIdentifier = "ShowReportViewControllerSegueIdentifier"
        static let searchCityViewControllerSegueIdentifier = "SearchCityViewControllerSegueIdentifier"
        static let searchViewControllerStoryboardID = "SearchViewControllerStoryboardID"
        static let reportViewControllerStoryboardID = "ReportViewControllerStoryboardID"
        static let weatherKey = "weather"
        static let forecastKey = "forecast"
    }
    
    static let backgoundimageSearch = "bg-WeatherPage"
    static let backgroundimageResult = "bg-CityEntryPage"
}

