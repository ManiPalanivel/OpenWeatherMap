////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import Foundation

class QueryParamGenerator{
    static func generateURL(queryParam : [String : String], path: String) -> String{
        var urlComponents = URLComponents.init()
        urlComponents.scheme = Constant.urlScheme
        urlComponents.host = Constant.baseURL
        urlComponents.path = "\(Constant.commonPath)\(path)"
        urlComponents.setQueryItems(with: queryParam)
        return urlComponents.url?.absoluteString ?? "";
    }
}


