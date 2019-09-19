////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

class Utility{
    
    static let weekDays = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    static func getDayOfWeek(_ date:String) -> String? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: String(date.split(separator: " ")[0])) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDays[weekDay - 1]
    }
    
    static func convertKelvinToCelcius(tempinK : Double) -> Double
    {
        let output = tempinK - 273.15
        return output.rounded(toPlaces: 2)
    }
    
    static func trimString(input: String) -> String{
        return input.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
