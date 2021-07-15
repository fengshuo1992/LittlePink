//
//  POIViewController.swift
//  LittlePink
//
//  Created by fengshuo on 2021/7/14.
//

import UIKit

class POIViewController: UIViewController {
    var points = kPOIsInitArr
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    lazy var locationManager =  AMapLocationManager();
    var originArray = kPOIsInitArr
    ///搜索相关的
   lazy var mapsearch:AMapSearchAPI = AMapSearchAPI()
    var keywords = ""
    var latitude = 0.0
    var longitude = 0.0
    ///关键字搜索
    lazy var keywordSearchRequest:AMapPOIKeywordsSearchRequest = {
        let request = AMapPOIKeywordsSearchRequest()
        request.location = AMapGeoPoint.location(withLatitude: CGFloat(latitude), longitude: CGFloat(longitude))
        request.requireExtension = true
        return request
    }()
    
    //搜索周边POI请求
    lazy var aroundSearchRequest: AMapPOIAroundSearchRequest = {
        let request = AMapPOIAroundSearchRequest()
        request.types = kPOITypes
        request.location = AMapGeoPoint.location(withLatitude: CGFloat(latitude), longitude: CGFloat(longitude))
        request.requireExtension = true
        request.offset = kPOIsOffset
        return request
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     config()
     requestlocation()
    }

}

extension POIViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        points.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KPOITableViewCellID, for: indexPath) as! POITableViewCell
        cell.contentArray = points[indexPath.row]
        return cell
    }
}

extension POIViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true)
    }
    
    ///搜索按钮的时候
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isBlank else {return}
        points.removeAll()
        keywords = searchText
        keywordSearchRequest.keywords = keywords
        mapsearch.aMapPOIKeywordsSearch(keywordSearchRequest)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            points.removeAll()
            points = originArray
            tableView.reloadData()
        }
    }
}
