//
//  ViewController.swift
//  NaverMapPractice
//
//  Created by soyounglee on 2020/12/23.
//

/*
 네이버지도 pod은 안깔았음 - git에 올리기에 너무 큰 파일 ㅠ _ ㅠ
 */

import UIKit
import NMapsMap
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: NMFMapView!
    
    //LocationManager 선언
    var locationManager:CLLocationManager!
    
    //위도와 경도
    var latitude: Double?
    var longitude: Double?
    
    
    var camera: NMFCameraUpdate!
    var coord = NMGLatLng(lat: 37.48101907116926, lng: 126.89632142650325)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //locationManager 인스턴스 생성 및 델리게이트 생성
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        //포그라운드 상태에서 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        
        //배터리에 맞게 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        //위치업데이트
        locationManager.startUpdatingLocation()
        
        //위도 경도 가져오기
        let coor = locationManager.location?.coordinate
        latitude = coor?.latitude
        longitude = coor?.longitude
     
        mapView.touchDelegate = self
        setCamera()
        setMarker()
    }
    
    func setCamera() {
        coord = NMGLatLng(lat: latitude!, lng: longitude!)
        camera = NMFCameraUpdate(scrollTo: coord)
        camera.animation = .linear
        mapView.moveCamera(camera)
    }
    
    func setMarker() {
        coord = NMGLatLng(lat: latitude!, lng: longitude!)
        let marker = NMFMarker()
        marker.position = coord
        marker.iconImage = NMapsMap.NMF_MARKER_IMAGE_BLUE
        marker.mapView = mapView
    }
    
}

extension ViewController: NMFMapViewTouchDelegate {
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("\(latlng)")
    }
    
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        print(symbol)
        
        return true
    }
}
