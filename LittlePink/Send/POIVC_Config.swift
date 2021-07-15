//
//  POIVC_Config.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/14.
//

extension POIViewController {
    func config(){
        //定位
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.locationTimeout = 5
        locationManager.reGeocodeTimeout = 5
        
        mapsearch.delegate = self
    }
}

