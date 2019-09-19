////  OpenWeatherMap
//
//  Created by Mani on 19/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    private var  weatherControllerViewModel: WeatherControllerViewModel!
    private var weatherService : WeatherServiceManager!
    private var forecastService : ForecastServiceManager!
    private var forecastViewModel : ForecastControllerViewModel!
    public var searchCity : String = ""
    
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var foreCastStackView: UIStackView!
    @IBOutlet weak var currentClimateDescription: UILabel!
    @IBOutlet weak var maxTempLbl: UILabel!
    @IBOutlet weak var minTempLbl: UILabel!
    @IBOutlet weak var climateImgView: UIImageView!
    
    
    @IBAction func changeCityBtnTapped(_ sender: Any) {
        self.navigateToSearch()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherService = WeatherServiceManager.init()
        forecastService = ForecastServiceManager.init()
        self.setBackgroundImage(imageNamed: Constant.backgroundimageResult)
        self.setpreferredStatusBarStyle(statusBarStyle: .default)
        if searchCity.isEmpty{
            self.checkDefaultValue()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !searchCity.isEmpty {
        self.weatherControllerViewModel = WeatherControllerViewModel.init(queryParam: searchCity, weatherServiceManager: weatherService, weatherDelegate: self)
        self.forecastViewModel = ForecastControllerViewModel.init(queryParam: searchCity, forecastServiceManager: forecastService, forecastDelegate: self)
        }
        self.foreCastStackView.alignment = .fill
        self.foreCastStackView.distribution = .fillEqually
        self.foreCastStackView.spacing = 5
    }
    
    func checkDefaultValue(){
        let decoder = JSONDecoder()
        if let data = StorageServiceManager.shared.retrieveData(key: Constant.identifiers.weatherKey) {
            if let storedWeather = try? decoder.decode(Weather.self, from: data) {
                didUpdateWeatherReport(weatherReport: storedWeather)
            }
        }
        if let data = StorageServiceManager.shared.retrieveData(key: Constant.identifiers.forecastKey) {
            if let storedForecast = try? decoder.decode(ForeCast.self, from: data) {
                didUpdateForecastReport(forecastReport: storedForecast)
            }
        }
    }
    
    func removeSubView(){
        for subView in self.foreCastStackView.arrangedSubviews {
            self.foreCastStackView.removeArrangedSubview(subView)
            subView.removeFromSuperview()
        }
    }
    
    func registerXib(forecast : ForeCastDay){
        DispatchQueue.main.async {
            let foreCastView = UINib(nibName: "ForeCastView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ForeCastView
            foreCastView.updateView(foreCastDay: forecast)
            self.foreCastStackView.addArrangedSubview(foreCastView)
        }
    }
    
    func updateView(weatherReport: Weather){
        self.cityLbl.text = weatherReport.name
        self.climateImgView.setImage(from: weatherReport.weather[0].icon)
        self.currentTempLbl.text = "\(Int(Utility.convertKelvinToCelcius(tempinK: weatherReport.main.temp)))°"
        self.currentClimateDescription.text = weatherReport.weather[0].description
        self.maxTempLbl.text = "\(Int(Utility.convertKelvinToCelcius(tempinK: weatherReport.main.temp_max)))°"
        self.minTempLbl.text = "\(Int(Utility.convertKelvinToCelcius(tempinK: weatherReport.main.temp_min)))°"
    }
    
    func navigateToSearch(){
        self.performSegue(withIdentifier: Constant.identifiers.searchCityViewControllerSegueIdentifier, sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//MARK :- Protocol Implementation
extension ReportViewController : WeatherDelegate {
    func didUpdateWeatherReport(weatherReport: Weather) {
        if(weatherReport.cod == 200){
            DispatchQueue.main.async {
                self.updateView(weatherReport: weatherReport)
            }
        }
        else{
            AlertController.showAlert(inView: self, withMessage: "Something went wrong. Please try again!", messageTitle: "", withActions: nil)
            self.navigateToSearch()
        }
    }
}

extension ReportViewController : ForeCastDelegate{
    func didUpdateForecastReport(forecastReport: ForeCast) {
        if(forecastReport.cod == "200"){
            DispatchQueue.main.async {
                self.removeSubView()
            }
            if forecastReport.list.count > 0{
                let filteredArray = forecastReport.list.filter{$0.dt_txt.contains("21:00:00")}
                for index in filteredArray{
                    registerXib(forecast: index)
                }
            }
        }
        else{
            AlertController.showAlert(inView: self, withMessage: "Something went wrong. Please try again!", messageTitle: "", withActions: nil)
            self.navigateToSearch()
        }
    }
}


extension ReportViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.identifiers.searchCityViewControllerSegueIdentifier{
            if let destinationViewcontroller = segue.destination as? SearchCityViewController {
                destinationViewcontroller.hideBtn = false
            }
        }
    }
}
