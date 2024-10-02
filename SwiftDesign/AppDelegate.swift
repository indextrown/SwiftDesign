//
//  AppDelegate.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/24/24.
//

import UIKit
import BackgroundTasks
import UserNotifications

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 알림 권한 요청
        requestNotificationAuthorization()

        // Background Task 등록
//        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.url.myidentifier", using: nil) { task in
//            self.handleAppRefresh(task: task as! BGAppRefreshTask)
//        }

        // 첫 번째 백그라운드 작업 스케줄링
        // scheduleAppRefresh()
        return true
    }

    // 백그라운드 작업 처리
//    func handleAppRefresh(task: BGAppRefreshTask) {
//        // 새로 작업을 스케줄링합니다.
//        scheduleAppRefresh()
//
//        // API 데이터를 가져오고 알림을 보내는 작업 수행
//        fetchApiData { result in
//            self.sendNotification(body: result)
//            task.setTaskCompleted(success: true)
//        }
//
//        // 작업의 만료 시간을 처리합니다.
//        task.expirationHandler = {
//            // 작업이 만료되었을 때 할 수 있는 일을 수행합니다.
//            task.setTaskCompleted(success: false)
//        }
//    }

    // 백그라운드 작업 스케줄링
//    func scheduleAppRefresh() {
//        let request = BGAppRefreshTaskRequest(identifier: "com.url.myidentifier")
//        request.earliestBeginDate = Date(timeIntervalSinceNow: 1) // 15분 이후
//        
//        do {
//            try BGTaskScheduler.shared.submit(request)
//        } catch {
//            print("백그라운드 작업 스케줄링 실패: \(error)")
//        }
//    }

    // 알림 권한 요청
//    func requestNotificationAuthorization() {
//        let center = UNUserNotificationCenter.current()
//        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
//            if let error = error {
//                print("Error requesting notification authorization: \(error.localizedDescription)")
//            }
//            if granted {
//                print("알림 권한이 허용되었습니다.")
//            } else {
//                print("알림 권한이 거부되었습니다.")
//            }
//        }
//    }

    // API 데이터 가져오기
//    func fetchApiData(completion: @escaping (String) -> Void) {
//        let apiResult = "API 호출 결과입니다." // 실제 API 호출 로직을 여기에 추가
//        completion(apiResult)
//    }

    // 알림 전송
//    func sendNotification(body: String) {
//        let content = UNMutableNotificationContent()
//        content.title = "API 결과"
//        content.body = body
//        content.sound = UNNotificationSound.default
//        
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
//        
//        UNUserNotificationCenter.current().add(request) { error in
//            if let error = error {
//                print("알림 요청 에러: \(error.localizedDescription)")
//                print("알림 요청 에러: \(error.localizedDescription)")
//            }
//        }
//    }
}
