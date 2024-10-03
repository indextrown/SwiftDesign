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
class LocationManager2: NSObject, ObservableObject, CLLocationManagerDelegate {
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let newRegion = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        // 현재 region과 새로운 region이 다를 때만 업데이트
        if newRegion.center.latitude != region.center.latitude || newRegion.center.longitude != region.center.longitude {
            DispatchQueue.main.async {
                self.region = newRegion
            }
        }
    }

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

//
//
//import SwiftUI
//import MapKit
//import CoreLocation
//
//struct MapLocationManagerView: View {
//    @StateObject private var locationManager = LocationManager()  // 위치 업데이트 관리할 객체
//    @State private var isShowMapView: Bool = false
//    
//    var body: some View {
//        ZStack {
//            if isShowMapView {
//                // 지도 뷰를 보여줌
//                Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: locationManager.nearbyPlaces) { place in
//                    // 장소에 대한 마커(annotation)을 지도에 추가
//                    MapAnnotation(coordinate: place.coordinate) {
//                        Image(systemName: "pill.circle")
//                            .resizable()
//                            .foregroundColor(.red)                  // 마커 색상 설정
//                            .background(Circle().fill(.white))      // 마커 배경 설정
//                            .frame(width: 40, height: 40)           // 마커 크기 설정
//                            .shadow(radius: 4)                      // 그림자 추가
//                    }
//                }
//                .edgesIgnoringSafeArea(.top)  // 맵이 화면 전체를 채우도록 설정
//            }
//        }
//        .onAppear {
//            isShowMapView = true
//            // locationManager.updateRegionToCurrentLocation()  // 뷰가 나타날 때 사용자의 현재 위치로 이동
//        }
//    }
//}
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    private let locationManager = CLLocationManager()
//    
//    @Published var region = MKCoordinateRegion()  // 현재 지도의 영역(중심 좌표와 범위)
//    @Published var nearbyPlaces: [Place] = []     // 지도에 표시할 주변 장소들
//    
//    override init() {
//        super.init()
//        self.locationManager.delegate = self
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.startUpdatingLocation()
//    }
//    
//    // 위치가 업데이트될 때마다 호출되는 함수
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//        
//        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(
//                center: location.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//            )
//        }
//    }
//    
//    // 내 위치로 카메라 이동하는 함수
//    func updateRegionToCurrentLocation() {
//        guard let location = locationManager.location else { return }
//        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(
//                center: location.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//            )
//        }
//    }
//}
//
//struct Place: Identifiable {
//    let id = UUID()
//    let coordinate: CLLocationCoordinate2D
//    let name: String
//}
//
//#Preview {
//    MapLocationManagerView()
//}
