////  OpenWeatherMap
//
//  Created by Mani on 18/09/19
//  Copyright © 2019 Mani. All rights reserved.
//

import UIKit

class SearchCityViewController: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var searchCityTextField: CustomUITextField!
    private var searchCityViewModel : SearchCityViewModel!
    public var hideBtn = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setBackgroundImage(imageNamed: Constant.backgoundimageSearch)
        self.setpreferredStatusBarStyle(statusBarStyle: .lightContent)
        self.navigationController?.isNavigationBarHidden = true
        closeBtn.isHidden = hideBtn
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchCityViewModel = SearchCityViewModel.init(searchViewDelegate: self)
        closeBtn.isHidden = hideBtn
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        self.closeBtn.isHidden = true
        self.performSegue(withIdentifier: Constant.identifiers.showReportViewControllerSegueIdentifier, sender: nil)
    }
    
    @IBAction func enterCityActionBtnTapped(_ sender: Any) {
        self.searchCityViewModel.validateCity(input: self.searchCityTextField.text ?? "")
    }
    
}

extension SearchCityViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.identifiers.showReportViewControllerSegueIdentifier{
            if let destinationViewcontroller = segue.destination as? ReportViewController {
                if let searchText = self.searchCityTextField.text {
                    destinationViewcontroller.searchCity = Utility.trimString(input: searchText)
                }
            }
        }
    }
}


extension SearchCityViewController : SearchViewDelegate{
    func validatedResult(isValid: Bool) {
        if(isValid){
             self.performSegue(withIdentifier: Constant.identifiers.showReportViewControllerSegueIdentifier, sender: nil)
        }else{
            print("error")
        }
    }
}



