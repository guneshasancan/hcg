//
//  ViewController.swift
//  HCG
//
//  Created by Hasan Can on 28.02.2021.
//

import UIKit

class OnboardingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getCities { (cities) in
            for i in cities!  {
                print(i.city)
            }
        }
    }
    
    func getCities(completion: @escaping(([Cities]?) -> Void)) {
        
        Network.shared.get(BaseURL.apiURL, params: nil, withHeader: true) { (jsonData, code, err) in
            if err == nil {
                var cities: [Cities] = []
                if let dataArray = jsonData?["data"].array {
                    if !dataArray.isEmpty {
                        for city in dataArray {
                            cities.append(Cities(plate_no: city["plate_no"].intValue, photo: city["photo"].stringValue, city: city["city"].stringValue))
                        }
                        completion(cities)
                    }
                }
            }
        }
        
    }

    

}

