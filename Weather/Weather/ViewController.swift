//
//  ViewController.swift
//  Weather
//
//  Created by Deepson on 6/26/19.
//  Copyright © 2019 Deepson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var lblResult: UILabel!
   
    @IBAction func btnSearch(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string:"https://www.weather-forecast.com/locations/London/forecasts/latest")!
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            if error != nil {
                print("error")
            }else{
                if  let unrappedData = data{
                    let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    var stringSeperator = "London Weather Today </h2>(1&ndash;3 days)</span><p class=\"b-forecast__table-description-content\"><span class=\"phrase\">"
                    
                    if let contentArray = dataString?.components(separatedBy: stringSeperator){
                        if contentArray.count>0{
                            stringSeperator = "</span>"
                            let newContentArray = contentArray[1].components(separatedBy: stringSeperator)
                                if newContentArray.count>0{
                                print(newContentArray[0])
                            }
                            
                        }
                    }
                }
            }
        }
        task.resume()
        
        }

}

