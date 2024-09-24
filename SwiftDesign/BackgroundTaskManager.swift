//
//  BackgroundTaskManager.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/24/24.
//
//
//import Foundation
//import BackgroundTasks
//
//class BackgroundTaskManager {
//    static let shared = BackgroundTaskManager()
//    
//    private init() {
//        // 백그라운드 태스크 등록
//        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.url.myidentifier", using: nil) { task in
//            self.handleAppRefresh(task: task as! BGAppRefreshTask)
//        }
//    }
//    
//    func scheduleAppRefresh() {
//        let request = BGAppRefreshTaskRequest(identifier: "com.url.myidentifier")
//        request.earliestBeginDate = Date(timeIntervalSinceNow: 60) // 최소 1분 후 실행
//        
//        do {
//            try BGTaskScheduler.shared.submit(request)
//        } catch {
//            print("태스크 제출 오류: \(error)")
//        }
//    }
//    
//    private func handleAppRefresh(task: BGAppRefreshTask) {
//        scheduleAppRefresh() // 다음 태스크 예약
//        
//        // API 호출
//        fetchAPIData { result in
//            sendNotification(body: result) // 결과로 알림 전송
//            task.setTaskCompleted(success: true) // 태스크 완료 표시
//        }
//    }
//    
//    private func fetchAPIData(completion: @escaping (String) -> Void) {
//        // 실제 API 호출 구현
//        // 테스트를 위한 시뮬레이션 응답
//        let simulatedResponse = "API 호출 결과"
//        completion(simulatedResponse)
//    }
//}
//
