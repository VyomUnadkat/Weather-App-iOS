//
//  Forecast.swift
//  rainy
//
//  Created by Vyom Unadkat on 10/09/17.
//  Copyright © 2017 Vyom Unadkat. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class forecast{
    
    var _day : String!
    var _weatherimage : UIImage!
    var _maxtemp : Double!
    var _mintemp : Double!
    var _weathertype : String!
    
    var dayy: String{
        if _day == nil{
            _day = ""
        }
        
        return _day
    }
    
    var weathertype: String{
        if _weathertype == nil{
            _weathertype = ""
        }
        return _weathertype
    }
    
    var maxtemp: Double{
        if _maxtemp == nil{
            _maxtemp = 0.0
        }
        return _maxtemp
    }
    
    var mintemp: Double{
        if _mintemp == nil{
            _mintemp = 0.0
        }
        return _mintemp
    }
    
    
    init(weatherdownload: Dictionary<String, AnyObject>) {
        if let temp = weatherdownload["temp"] as? Dictionary<String, AnyObject>{
            if let min = temp["min"] as? Double{
                self._mintemp = min - 273
            }
            
            if let max = temp["max"] as? Double{
                self._maxtemp = max - 273
            }
        }
        
        if let weather = weatherdownload["weather"] as? [Dictionary<String, AnyObject>]{
            if let main = weather[0]["main"] as? String{
                self._weathertype = main
            }
            
        }
        
        if let date = weatherdownload["dt"] as? Double{
            let unixconverter = Date(timeIntervalSince1970: date)
            let dateformatter = DateFormatter()
            //dateformatter.dateStyle = .full
            dateformatter.dateFormat = "EEEE"
            dateformatter.timeStyle = .none
            _day = unixconverter.dayoftheweek()
        }
        
    }
    
}

extension Date{
    func dayoftheweek() -> String {
        var dateformatter = DateFormatter()
        dateformatter.dateFormat = "EEEE"
        return dateformatter.string(from: self)
    }
}
