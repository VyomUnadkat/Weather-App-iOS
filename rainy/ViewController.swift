//
//  ViewController.swift
//  rainy
//
//  Created by Vyom Unadkat on 30/08/17.
//  Copyright © 2017 Vyom Unadkat. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var table: UITableView!
    
    var test: currentweather!
    var test2: forecast!
    var forecasts = [forecast]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        
        test = currentweather()
        test.downloadcomp {
            self.downloadforecastdata(){
                
            }
            self.updatedata()
        }
        
        
        
    }
    
    
    func updatedata(){
        
        tempLabel.text = String(test.temp)
        
        let ns5String = String(test.temp) as NSString
        tempLabel.text = ns5String.substring(with: NSRange(location: 0, length: ns5String.length > 5 ? 5 : ns5String.length))
        
        cityLabel.text = test.city
        dateLabel.text = test.date
        weatherLabel.text = test.weather
        imageLabel.image = UIImage(named: test.weather)
        
        
    }
    
    func downloadforecastdata(completed: @escaping downloadComplete){
        
        Alamofire.request(foURL).responseJSON{response in
            
            let result = response.result
                print(result)
            
            if let dict = result.value as? Dictionary<String, AnyObject>{
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>]{
                    for obj in list{
                        var test2 = forecast(weatherdownload : obj)
                        self.forecasts.append(test2)
                        print(obj)
                        
                        
                        
                    }
                    self.table.reloadData()
                    
                }
                
            }
            
            completed()
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count - 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? weathercell{
            let forecast = forecasts[indexPath.row + 1]
            cell.config(forecast:forecast)
            return cell
            
        }else
        {
            return weathercell()
        }
        
        
    }
    
    
    
}

