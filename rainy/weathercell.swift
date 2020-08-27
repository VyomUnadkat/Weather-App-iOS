//
//  weathercell.swift
//  rainy
//
//  Created by Vyom Unadkat on 18/09/17.
//  Copyright © 2017 Vyom Unadkat. All rights reserved.
//

import UIKit

class weathercell: UITableViewCell {
    
    @IBOutlet weak var weatherimg: UIImageView!
    @IBOutlet weak var mintemp: UILabel!
    @IBOutlet weak var maxtemp: UILabel!
    @IBOutlet weak var weathertype: UILabel!
    @IBOutlet weak var day: UILabel!
    
    
    
    func config(forecast : forecast){
        //mintemp.text = String(forecast.mintemp)
        let ns1String = String(forecast.mintemp) as NSString
        mintemp.text = ns1String.substring(with: NSRange(location: 0, length: ns1String.length > 5 ? 5 : ns1String.length))
        
        //maxtemp.text = String(forecast.maxtemp)
        let ns2String = String(forecast.maxtemp) as NSString
        maxtemp.text = ns2String.substring(with: NSRange(location: 0, length: ns2String.length > 5 ? 5 : ns2String.length))
        
        weathertype.text = forecast.weathertype
        //day.text = forecast.dayy
        let nsString = forecast.dayy as NSString
        day.text = nsString.substring(with: NSRange(location: 0, length: 3))
        weatherimg.image = UIImage(named: forecast.weathertype)
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
