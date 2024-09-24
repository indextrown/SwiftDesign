//
//  AppDelegate.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/24/24.
//

import UIKit
import BackgroundTasks


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Background Task Scheduler 등록
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.yourapp.refresh", using: nil) { task in
            self.handleAppRefresh(task: task as! BGAppRefreshTask)
        }
        return true
    }

    // 백그라운드 작업 처리
    func handleAppRefresh(task: BGAppRefreshTask) {
        // 백그라운드 작업이 완료되면 호출되는 메서드
        scheduleAppRefresh() // 다음 작업 예약
        fetchAPIData { result in
            print(result) // "hello" 출력
        }

//        fetchAPIData { result in
//            
//            switch result {
//            case .success:
//                task.setTaskCompleted(success: true)
//            case .failure:
//                task.setTaskCompleted(success: false)
//            }
//        }
    }

    // API 호출 함수
    private func fetchAPIData(completion: @escaping (Result<Void, Error>) -> Void) {
        // 여기에 API 호출 코드 작성
        // 예: URLSession을 사용하여 API 요청
        // 성공 시 completion(.success), 실패 시 completion(.failure(error)) 호출
    }

    // 다음 앱 리프레시 작업 예약
    private func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.yourapp.refresh")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 15) // 15초

        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("백그라운드 작업 예약 실패: \(error)")
        }
    }
}
