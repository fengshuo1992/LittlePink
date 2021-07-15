//
//  POIVC_Location.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/14.
//

extension POIViewController {
    func requestlocation() {
        locationManager.requestLocation(withReGeocode: true, completionBlock: { [weak self] (location: CLLocation?, reGeocode: AMapLocationReGeocode?, error: Error?) in
                    
            if let error = error {
                let error = error as NSError
                
                if error.code == AMapLocationErrorCode.locateFailed.rawValue {
                    //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
                    print("定位错误:{\(error.code) - \(error.localizedDescription)};")
                    return
                }
                else if error.code == AMapLocationErrorCode.reGeocodeFailed.rawValue
                    || error.code == AMapLocationErrorCode.timeOut.rawValue
                    || error.code == AMapLocationErrorCode.cannotFindHost.rawValue
                    || error.code == AMapLocationErrorCode.badURL.rawValue
                    || error.code == AMapLocationErrorCode.notConnectedToInternet.rawValue
                    || error.code == AMapLocationErrorCode.cannotConnectToHost.rawValue {
                    
                    //逆地理错误：在带逆地理的单次定位中，逆地理过程可能发生错误，此时location有返回值，regeocode无返回值，进行annotation的添加
                    print("逆地理错误:{\(error.code) - \(error.localizedDescription)};")
                }
                else {
                    //没有错误：location有返回值，regeocode是否有返回值取决于是否进行逆地理操作，进行annotation的添加
                }
            }
            guard let POIVC = self else {return}
            
            if let location = location {
                POIVC.longitude = location.coordinate.longitude;
                POIVC.latitude = location.coordinate.latitude;
                
                POIVC.mapsearch.aMapPOIAroundSearch(POIVC.aroundSearchRequest);
            }
            
            if let reGeocode = reGeocode {
                guard let formattedAddress = reGeocode.formattedAddress, !formattedAddress.isEmpty else {return}
                let province = reGeocode.province == reGeocode.city ? "" : reGeocode.province
                let currnetLocat = [province.unwrappedText, "\(province.unwrappedText) \(reGeocode.city.unwrappedText) \(reGeocode.street.unwrappedText) \(reGeocode.number.unwrappedText)"]
                POIVC.points.append(currnetLocat)
                
                DispatchQueue.main.async {
                    POIVC.tableView.reloadData()
                }
                
            }
        })
    }
}


extension POIViewController:AMapSearchDelegate {
    func onPOISearchDone(_ request: AMapPOISearchBaseRequest!, response: AMapPOISearchResponse!) {
        if response.count <= 0 {
            return
        }
        for poi in response.pois {
            let province = poi.province == poi.city ? "" : poi.province
            let address = poi.district == poi.address ? "" : poi.address

            let poi = [
                poi.name ?? kNoPOIPH,
                "\(province.unwrappedText)\(poi.city.unwrappedText)\(poi.district.unwrappedText)\(address.unwrappedText)"
            ]
            points.append(poi)
            if request is AMapPOIAroundSearchRequest {
                originArray = points
            }
            tableView.reloadData()
        
        }
    }
}
