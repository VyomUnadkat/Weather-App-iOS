//
//  currentWeather.swift
//  rainy
//
//  Created by Vyom Unadkat on 02/09/17.
//  Copyright © 2017 Vyom Unadkat. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class currentweather{
    
    var _temp : Double!
    var _date : String!
    var _weather : String!
    var _city : String!

    var temp: Double{
        if _temp == nil
        {
            _temp = 0.0
        }
        return _temp
    }
    
    var date: String{
        
        if _date == nil
        {
            _date = "X"
        }
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .long
        dateformatter.timeStyle = .none
        let currentdate = dateformatter.string(from: Date())
        self._date = "Today, \(currentdate)"
        return _date
    }
    


    var weather: String{
        if _weather == nil
        {
            _weather = "X"
        }
        return _weather
    }

    var city: String{
        if _city == nil
        {
            _city = "X"
        }
        return _city
    }
    
    
    
    
    
    func downloadcomp(completed : @escaping downloadComplete)
    {
        Alamofire.request(FURL).responseJSON{response in
            let result = response.result
            print(result)
            
            
            if let dict = result.value as? Dictionary<String, AnyObject>
            {
                if let name = dict["name"] as? String{
                    self._city = name.capitalized
                    print(self._city)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]{
                    
                    if let main = weather[0]["main"] as? String{
                        
                        self._weather = main
                        print(self._weather)
                    }
                    
                }
                
                if let main1 = dict["main"] as? Dictionary<String, AnyObject>{
                    
                    if let temp = main1["temp"] as? Double{
                        
                        self._temp = (temp - 273)
                        print(self._temp)
                    }
                    
                }
            }
       completed() 
    }
       
    }
    
    
   
    
}





    
    
