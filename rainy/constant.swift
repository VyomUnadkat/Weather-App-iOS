//
//  constant.swift
//  rainy
//
//  Created by Vyom Unadkat on 02/09/17.
//  Copyright © 2017 Vyom Unadkat. All rights reserved.
//

import Foundation


let URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "lat="
let LONG = "&lon="
let APPID = "&appid=60cca39fd7a55a5208f36e8e6affa899"

let vyomL = 19.0760
let vyomLo = 72.877

let FURL: String = "\(URL)\(LAT)\(vyomL)\(LONG)\(vyomLo)\(APPID)"


let fURL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let fLAT = "lat="
let fLONG = "&lon="
let fAPPID = "&cnt=10&mode=json&appid=42a1771a0b787bf12e734ada0cfc80cb"
let foURL = "\(fURL)\(fLAT)\(vyomL)\(fLONG)\(vyomLo)\(fAPPID)"



typealias downloadComplete = () -> ()




