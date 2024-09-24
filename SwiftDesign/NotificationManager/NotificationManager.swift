//
//  NotificationManager.swift
//  SwiftDesign
//
//  Created by 김동현 on 9/24/24.
//


import SwiftUI

// API 호출 함수 (예시)
//func fetchAPIData(completion: @escaping (String) -> Void) {
//    // 여기에 실제 API 호출 코드를 작성
//    // URLSession 등을 사용하여 API 요청을 보냅니다.
//    
//    // 이 예제에서는 임의의 데이터로 대체합니다.
//    let result = "API 호출 결과 메시지"
//    
//    // API 호출 완료 후 completion 핸들러 호출
//    completion(result)
//}
//



func sendNotification(detail body: String) {
    // 알림 콘텐츠 생성 
    let content = UNMutableNotificationContent()
    content.title = "StarBridge"
    content.body = "키워드: \(body)"
    content.sound = UNNotificationSound.default
    
    // 5초 후에 알림이 뜨도록 트리거 설정
    // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    // 알림 요청 생성
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
    
    // 알림 요청을 Notification Center에 추가
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("알림 요청 에러: \(error.localizedDescription)")
        } else {
            print("알림이 성공적으로 등록됨")
        }
    }
}

func sendNotification() {
    // 알림 콘텐츠 생성
    let content = UNMutableNotificationContent()
    content.title = "푸시 알림 제목"
    content.body = "이것은 버튼을 눌러서 보낸 알림입니다."
    content.sound = UNNotificationSound.default
    
    // 5초 후에 알림이 뜨도록 트리거 설정
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
    
    // 알림 요청 생성
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    
    // 알림 요청을 Notification Center에 추가
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("알림 요청 에러: \(error.localizedDescription)")
        } else {
            print("알림이 성공적으로 등록됨")
        }
    }
}

func requestNotificationAuthorization() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        if let error = error {
            print("Error requesting notification authorization: \(error.localizedDescription)")
        }
        if granted {
            print("알림 권한이 허용되었습니다.")
        } else {
            print("알림 권한이 거부되었습니다.")
        }
    }
}

func startBackgroundNotifications() {
    // 알림 콘텐츠 생성
    let content = UNMutableNotificationContent()
    content.title = "정기 알림"
    content.body = "1분 간격으로 보내는 알림입니다."
    content.sound = UNNotificationSound.default

    // 10분(600초) 간격으로 알림을 보내도록 트리거 설정
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
    
    // 알림 요청 생성
    let request = UNNotificationRequest(identifier: "backgroundNotification", content: content, trigger: trigger)

    // 알림 요청을 Notification Center에 추가
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("알림 요청 에러: \(error.localizedDescription)")
        } else {
            print("백그라운드 알림이 성공적으로 등록됨")
        }
    }
}

func startHourlyNotifications() {
    // 알림 콘텐츠 생성
    let content = UNMutableNotificationContent()
    content.title = "정기 알림"
    content.body = "매시간 7분과 37분에 보내는 알림입니다."
    content.sound = UNNotificationSound.default

    // 매시간 7분과 37분에 알림을 보내기 위한 트리거 설정
    var triggers: [UNCalendarNotificationTrigger] = []
    for minute in [7, 15, 30, 37, 40, 43] {
        var dateComponents = DateComponents()
        dateComponents.minute = minute
        dateComponents.second = 0
        // dateComponents.hour = 0 // 매시간
        dateComponents.hour = nil // 매시간 반복을 허용
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        triggers.append(trigger)
        
        // 알림 요청 생성 및 등록
        let request = UNNotificationRequest(identifier: "hourlyNotification_\(minute)", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("알림 요청 에러: \(error.localizedDescription)")
            } else {
                print("매시간 \(minute)분에 알림이 성공적으로 등록됨")
            }
        }
    }
    
    
    // API 호출 및 알림 등록
//    fetchAPIData { result in
//
//        // API 결과를 알림으로 표시
//        sendNotification(detail: "API 호출 결과: \(result)")
//    }
}









//
//
//
//
//
//
//
//import SwiftUI
//import UserNotifications
//
//func startHourlyApiCalls() {
//    scheduleApiCalls()
//}
//
//func scheduleApiCalls() {
//    Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { timer in
//        let currentDate = Date()
//        let calendar = Calendar.current
//        
//        let minute = calendar.component(.minute, from: currentDate)
//        
//        if minute == 5 || minute == 14 || minute == 15 || minute == 16 || minute == 21 || minute == 29 || minute == 36 || minute == 35 || minute == 34 || minute == 28 || minute == 27 {
//            fetchApiData { result in
//                sendNotification(body: result)
//            }
//        }
//    }
//}
//
//func fetchApiData(completion: @escaping (String) -> Void) {
//    let apiResult = "5분, 35분 API 호출 결과입니다." // 실제 API 호출 결과를 넣어주세요.
//    completion(apiResult)
//}
//
//func sendNotification(body: String) {
//    let content = UNMutableNotificationContent()
//    content.title = "API 결과"
//    content.body = body
//    content.sound = UNNotificationSound.default
//    
//    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
//    
//    UNUserNotificationCenter.current().add(request) { error in
//        if let error = error {
//            print("알림 요청 에러: \(error.localizedDescription)")
//        }
//    }
//}
//
//func requestNotificationAuthorization() {
//    let center = UNUserNotificationCenter.current()
//    center.requestAuthorization(options: [.alert, .sound]) { granted, error in
//        if let error = error {
//            print("Error requesting notification authorization: \(error.localizedDescription)")
//        }
//        if granted {
//            print("알림 권한이 허용되었습니다.")
//        } else {
//            print("알림 권한이 거부되었습니다.")
//        }
//    }
//}
