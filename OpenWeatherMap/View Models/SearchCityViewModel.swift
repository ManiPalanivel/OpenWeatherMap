////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

struct SearchCityViewModel{
    
    private var searchViewDelegate : SearchViewDelegate
    
    init(searchViewDelegate : SearchViewDelegate) {
        self.searchViewDelegate = searchViewDelegate
    }
    
    func validateCity(input : String){
        let inputValue = Utility.trimString(input: input)
        if inputValue.count != 0 {
            self.searchViewDelegate.validatedResult(isValid: true)
            return
        }else{
            self.searchViewDelegate.validatedResult(isValid: false)
        }
    }
    
}
