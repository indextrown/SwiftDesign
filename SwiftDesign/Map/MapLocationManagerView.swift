//
//  MapLocationManagerView.swift
//  SwiftDesign
//
//  Created by 김동현 on 10/2/24.
//

/*
 <key>NSLocationWhenInUseUsageDescription</key>
 <string>앱이 실행 중일 때 위치 접근을 허용해주세요.</string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string>앱이 항상 위치 접근을 허용해주세요.</string>

 
 */

import SwiftUI
import MapKit
import CoreLocation

// LocationManager 클래스를 정의하여 사용자의 위치를 관리
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    // 사용자의 위치가 업데이트될 때 호출되는 delegate 메서드
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(
//                center: location.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//            )
//        }
//    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // 비동기적으로 상태를 업데이트
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
        }
    }


    // 위치 권한이 변경되었을 때 호출
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            locationManager?.startUpdatingLocation()
        }
    }
}


struct MapLocationManagerView: View {
    @StateObject private var locationManager = LocationManager() // LocationManager를 StateObject로 사용
        
    var body: some View {
        Map(coordinateRegion: $locationManager.region, showsUserLocation: true)  // locationManager의 region을 바인딩하고 showsUserLocation 추가
            .ignoresSafeArea()  // 전체 화면을 지도로 채우기
    }
}

#Preview {
    MapLocationManagerView()
}
