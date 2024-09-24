//
//  SwiftDesignApp.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/22/24.
//

import SwiftUI

@main
struct SwiftDesignApp: App {
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    //private var backgroundTaskManager = BackgroundTaskManager.shared
    var body: some Scene {
        WindowGroup {
            ContentView(isToggled: .init())
//                .onAppear {
//                backgroundTaskManager.scheduleAppRefresh() // 첫 번째 API 호출 예약
//                            }
        }
    }
}

//
//
//import UIKit
//
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//    var backgroundTask: UIBackgroundTaskIdentifier = .invalid
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//            requestNotificationAuthorization() // 알림 권한 요청
//            scheduleApiCalls() // API 호출 시작
//            return true
//        }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        startBackgroundTask()
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        endBackgroundTask()
//    }
//
//    func startBackgroundTask() {
//        backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "APICalls") {
//            UIApplication.shared.endBackgroundTask(self.backgroundTask)
//            self.backgroundTask = .invalid
//        }
//        
//        // API 호출을 위한 함수 호출
//        scheduleApiCalls()
//    }
//
//    func endBackgroundTask() {
//        UIApplication.shared.endBackgroundTask(backgroundTask)
//        backgroundTask = .invalid
//    }
//
//    var timer: Timer?
//
//    func scheduleApiCalls() {
//        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: true) { _ in
//            self.fetchApiData { result in
//                print(result)
//                self.sendNotification(body: result)
//            }
//        }
//    }
//
//    func fetchApiData(completion: @escaping (String) -> Void) {
//        let apiResult = "5분, 35분 API 호출 결과입니다." // 실제 API 호출 결과를 넣어주세요.
//        completion(apiResult)
//    }
//    func sendNotification(body: String) {
//            let content = UNMutableNotificationContent()
//            content.title = "API 호출 결과"
//            content.body = body
//            content.sound = .default
//            
//            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
//            
//            UNUserNotificationCenter.current().add(request) { error in
//                if let error = error {
//                    print("알림 전송 오류: \(error.localizedDescription)")
//                }
//            }
//        }
//}
//
//
//
//
//
////#Preview {
////    ContentView(isToggled: .init())
////}
////
////class AppDelegate: NSObject, UIApplicationDelegate {
////    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
////        fetchApiData { result in
////            sendNotification(body: result)
////            completionHandler(.newData) // 데이터가 새로 업데이트 되었음을 알림
////        }
////    }
////}
