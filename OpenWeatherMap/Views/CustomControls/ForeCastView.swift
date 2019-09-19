////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

class ForeCastView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var forecastDayLbl: UILabel!
    
    @IBOutlet weak var forecastTemperatureLbl: UILabel!
    @IBOutlet weak var forecastDayImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateView(foreCastDay : ForeCastDay){
        self.forecastDayLbl.text = Utility.getDayOfWeek(foreCastDay.dt_txt)
        self.forecastTemperatureLbl.text = "\(convertDecimal(input: foreCastDay.main.temp_max))/\(convertDecimal(input: foreCastDay.main.temp_min))"
        self.forecastDayImageView.setImage(from: foreCastDay.weather[0].icon)
    }
    
    func convertDecimal(input : Double) -> Int{
        let output = Utility.convertKelvinToCelcius(tempinK: input)
        return Int(output)
    }
    
}
