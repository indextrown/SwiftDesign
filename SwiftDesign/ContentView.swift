//
//  ContentView.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/22/24.
//

/*
 기본
 https://ios-development.tistory.com/1075
 
 성공실패
 https://chicharios.tistory.com/22
 
 리스트
 https://seons-dev.tistory.com/entry/SwiftUI-List#google_vignette
 https://ios-development.tistory.com/1094
 https://eunjoochoi.github.io/swiftui-tutorials/SwiftUI-8

 화살표 숨기기
 https://bradheo.tistory.com/entry/SwiftUI-List-NavigationLink-item-숨기는-방법
 
 백그라운드
 https://velog.io/@page/SwiftUI-생명주기를-활용한-백그라운드-타이머
 */

import SwiftUI
import UserNotifications


struct ContentView: View {
    @State var isToggled: Bool
    var body: some View {
        // navigationTitle는 NavigationView 내에서만 동작 -> NavigationView decrypted
        NavigationStack {
            VStack {
                
                List {
                    Section(header: Text("버튼 UI")) {
                        NavigationLink(destination: CustomButtonView()) {
                            Text("Button")
                        }
                        Button("알림 보내기") {
                            // 알림 권한 요청
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                                if granted {
                                    print("알림 권한 허용됨")
                                    sendNotification()
                                } else {
                                    print("알림 권한 거부됨")
                                }
                            }
                        }
                    }
                    
                    Section(header: Text("리스트 UI")) {
                        NavigationLink(destination: ListView()) {
                            Text("List")
                        }
                        NavigationLink(destination: CustomListView()) {
                            Text("Custom List")
                        }
                        NavigationLink(destination: ListDetailView(item: "테스트 문자열")) {
                            Text("List Detail View")
                        }
                    }
                    
                    Section(header: Text("백그라운드")) {
                        NavigationLink(destination: BackgroundStatusView()) {
                            Text("Background Ststus")
                        }
                        
                        NavigationLink(destination: BackgroundAlarmView()) {
                            Text("Background Alarm 30")
                        }
                    }
                    
                    Section(header: Text("지도")) {
                        NavigationLink(destination: MapView()) {
                            Text("Mapkit")
                        }
                        
                        NavigationLink(destination: MapLocationManagerView()) {
                            Text("MapLocationManager")
                        }
                    }
                }
                .navigationTitle("UI 리스트")
            }
            .onAppear {
                // MARK: - 앱꺼도 1분간격으로 동작
                // startBackgroundNotifications()
                startHourlyNotifications()
                
                
                //requestNotificationAuthorization()   // 알림 권한 요청
                //scheduleApiCalls()
//                startBackgroundNotifications()       // 백그라운드 알림 시작
//                startHourlyNotifications()       // 백그라운드 알림 시작
            }
        }
    }
}

#Preview {
    ContentView(isToggled: .init())
}





